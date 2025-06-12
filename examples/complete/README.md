# Complete AWS Security Group Example

This example demonstrates usage of the AWS Security Group module with most of its supported features:

- Multiple security groups with different rules
- Ingress rules with CIDR blocks
- Ingress rules with source security group references
- Egress rules with CIDR blocks
- Pre-defined rules (HTTP, HTTPS, PostgreSQL, Redis, MongoDB)
- Custom rules with specific ports
- IPv4 and IPv6 support
- VPC configuration

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| web_server_sg | ../../ | n/a |
| internal_sg | ../../ | n/a |
| vpc | terraform-aws-modules/vpc/aws | ~> 5.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| web_server_security_group_id | The ID of the web server security group |
| web_server_security_group_vpc_id | The VPC ID |
| web_server_security_group_name | The name of the web server security group |
| internal_security_group_id | The ID of the internal services security group |
| internal_security_group_vpc_id | The VPC ID |
| internal_security_group_name | The name of the internal services security group |
| vpc_id | The ID of the VPC |
| vpc_cidr_block | The CIDR block of the VPC |
| private_subnets | List of IDs of private subnets |
| public_subnets | List of IDs of public subnets | 