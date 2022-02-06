variable "vpc_id" {
  type    = string
  default = null
}

variable "public_zones" {
  type = list(object({
    name = string
  }))
  default = []
}

variable "private_zones" {
  type = list(object({
    name = string
  }))
  default = []
}

variable "records" {
  type = list(object({
    zone                             = string
    subdomain                        = string
    allow_overwrite                  = bool
    name                             = string
    type                             = string
    ttl                              = number
    set_identifier                   = string
    multivalue_answer_routing_policy = bool
    records                          = list(string)
    alias = list(object({
      name                   = string
      zone_id                = string
      evaluate_target_health = bool
    }))
    weighted_routing_policy = list(object({
      weight = number
    }))
    failover_routing_policy = list(object({
      type = string
    }))
    latency_routing_policy = list(object({
      region = string
    }))
    geolocation_routing_policy = list(object({
      continent   = string
      country     = string
      subdivision = string
    }))
  }))
  default = []
}

variable "certificate_validation_options" {
  type = map(object({
    zone   = string
    name   = string
    record = string
    type   = string
  }))
  default = null
}





