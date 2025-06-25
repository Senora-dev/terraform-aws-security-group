# AWS Security Group Terraform Module

This Terraform module creates and manages security groups with configurable ingress and egress rules.

## Features

- Create security groups
- Define multiple ingress and egress rules
- Support for self-referencing rules
- Tagging support

## Usage

```hcl
module "security_group" {
  source = "Senora-dev/security-group/aws"

  name        = "my-sg"
  description = "Security group for my app"
  vpc_id      = "vpc-12345678"

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the security group | `string` | n/a | yes |
| description | Description of the security group | `string` | n/a | yes |
| vpc_id | VPC ID | `string` | n/a | yes |
| ingress_rules | List of ingress rules | `list(object)` | `[]` | no |
| egress_rules | List of egress rules | `list(object)` | `[]` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| security_group_id | The ID of the security group |
| security_group_arn | The ARN of the security group |

## Maintainers

This module is maintained by [Senora.dev](https://senora.dev). 