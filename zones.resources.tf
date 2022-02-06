locals {
  zones = merge(aws_route53_zone.public_zones, aws_route53_zone.private_zones)
}

resource "aws_route53_zone" "public_zones" {
  for_each = { for zone in var.public_zones : zone.name => zone }
  name     = each.value.name
}

resource "aws_route53_zone" "private_zones" {
  for_each = { for zone in var.private_zones : zone.name => zone }
  name     = each.value.name
  vpc {
    vpc_id = var.vpc_id
  }
}
