# terraform-aws-dns
DNS IaC

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.certificate_validation_options](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.records](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.private_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_route53_zone.public_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_validation_options"></a> [certificate\_validation\_options](#input\_certificate\_validation\_options) | n/a | <pre>map(object({<br>    zone   = string<br>    name   = string<br>    record = string<br>    type   = string<br>  }))</pre> | `null` | no |
| <a name="input_private_zones"></a> [private\_zones](#input\_private\_zones) | n/a | <pre>list(object({<br>    name = string<br>  }))</pre> | `[]` | no |
| <a name="input_public_zones"></a> [public\_zones](#input\_public\_zones) | n/a | <pre>list(object({<br>    name = string<br>  }))</pre> | `[]` | no |
| <a name="input_records"></a> [records](#input\_records) | n/a | <pre>list(object({<br>    zone                             = string<br>    subdomain                        = string<br>    allow_overwrite                  = bool<br>    name                             = string<br>    type                             = string<br>    ttl                              = number<br>    set_identifier                   = string<br>    multivalue_answer_routing_policy = bool<br>    records                          = list(string)<br>    alias = list(object({<br>      name                   = string<br>      zone_id                = string<br>      evaluate_target_health = bool<br>    }))<br>    weighted_routing_policy = list(object({<br>      weight = number<br>    }))<br>    failover_routing_policy = list(object({<br>      type = string<br>    }))<br>    latency_routing_policy = list(object({<br>      region = string<br>    }))<br>    geolocation_routing_policy = list(object({<br>      continent   = string<br>      country     = string<br>      subdivision = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_validation_fqdns"></a> [certificate\_validation\_fqdns](#output\_certificate\_validation\_fqdns) | n/a |
<!-- END_TF_DOCS -->