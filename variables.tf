################################################################################
# Security Group
################################################################################

variable "create" {
  description = "Whether to create security group and all rules"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of security group"
  type        = string
}

variable "use_name_prefix" {
  description = "Whether to use name_prefix or fixed name. Should be true to able to update security group name after initial creation"
  type        = bool
  default     = true
}

variable "description" {
  description = "Description of security group"
  type        = string
  default     = "Security Group managed by Terraform"
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to security group"
  type        = map(string)
  default     = {}
}

################################################################################
# Ingress Rules
################################################################################

variable "ingress_rules" {
  description = "Map of known ingress rules (from_port, to_port, protocol)"
  type        = map(list(any))
  default = {
    # Format: rule = [from_port, to_port, protocol]
    "_"          = [0, 0, "-1"]
    "http"       = [80, 80, "tcp"]
    "https"      = [443, 443, "tcp"]
    "ssh"        = [22, 22, "tcp"]
    "postgresql" = [5432, 5432, "tcp"]
    "mysql"      = [3306, 3306, "tcp"]
    "mongodb"    = [27017, 27017, "tcp"]
    "redis"      = [6379, 6379, "tcp"]
  }
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "ingress_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_with_ipv6_cidr_blocks" {
  description = "List of ingress rules to create where 'ipv6_cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_with_source_security_group_id" {
  description = "List of ingress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

################################################################################
# Egress Rules
################################################################################

variable "egress_rules" {
  description = "Map of known egress rules (from_port, to_port, protocol)"
  type        = map(list(any))
  default = {
    # Format: rule = [from_port, to_port, protocol]
    "_"          = [0, 0, "-1"]
    "http"       = [80, 80, "tcp"]
    "https"      = [443, 443, "tcp"]
    "postgresql" = [5432, 5432, "tcp"]
    "mysql"      = [3306, 3306, "tcp"]
    "mongodb"    = [27017, 27017, "tcp"]
    "redis"      = [6379, 6379, "tcp"]
  }
}

variable "egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["::/0"]
}

variable "egress_with_cidr_blocks" {
  description = "List of egress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_with_ipv6_cidr_blocks" {
  description = "List of egress rules to create where 'ipv6_cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_with_source_security_group_id" {
  description = "List of egress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "rules" {
  description = "Map of security group rules with their configurations"
  type        = map(any)
  default     = {}
} 