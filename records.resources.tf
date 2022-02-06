resource "aws_route53_record" "records" {
  for_each                         = { for record in var.records : record.name => record }
  zone_id                          = lookup(local.zones, each.value.zone).id
  name                             = each.value.name
  type                             = each.value.type
  ttl                              = each.value.ttl
  set_identifier                   = each.value.set_identifier
  multivalue_answer_routing_policy = each.value.multivalue_answer_routing_policy
  records                          = each.value.subdomain != null ? lookup(local.zones, each.value.subdomain).name_servers : each.value.records

  dynamic "alias" {
    for_each = { for alias in each.value.alias : alias.name => alias }
    content {
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
      evaluate_target_health = alias.value.evaluate_target_health
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = { for index, policy in each.value.weighted_routing_policy : tostring(index) => policy }
    content {
      weight = weighted_routing_policy.value.weight
    }
  }

  dynamic "failover_routing_policy" {
    for_each = { for index, policy in each.value.failover_routing_policy : tostring(index) => policy }
    content {
      type = failover_routing_policy.value.type
    }
  }

  dynamic "latency_routing_policy" {
    for_each = { for index, policy in each.value.latency_routing_policy : tostring(index) => policy }
    content {
      region = latency_routing_policy.value.region
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = { for index, policy in each.value.geolocation_routing_policy : tostring(index) => policy }
    content {
      continent   = geolocation_routing_policy.value.continent
      country     = geolocation_routing_policy.value.country
      subdivision = geolocation_routing_policy.value.subdivision
    }
  }
}

resource "aws_route53_record" "certificate_validation_options" {
  for_each        = var.certificate_validation_options
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = lookup(local.zones, each.value.zone).id
  depends_on = [
    aws_route53_zone.public_zones,
    aws_route53_zone.private_zones
  ]
}
