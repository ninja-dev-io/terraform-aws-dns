output "certificate_validation_fqdns" {
  value = values(aws_route53_record.certificate_validation_options)[*].fqdn
}
