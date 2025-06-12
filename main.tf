################################################################################
# Security Group
################################################################################

resource "aws_security_group" "this" {
  count = var.create ? 1 : 0

  name        = var.use_name_prefix ? null : var.name
  name_prefix = var.use_name_prefix ? "${var.name}-" : null
  description = var.description
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      "Name" = var.name
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

################################################################################
# Security Group Rules
################################################################################

resource "aws_security_group_rule" "ingress_with_cidr_blocks" {
  count = var.create ? length(var.ingress_with_cidr_blocks) : 0

  security_group_id = aws_security_group.this[0].id
  type              = "ingress"

  cidr_blocks = split(",", lookup(var.ingress_with_cidr_blocks[count.index], "cidr_blocks", join(",", var.ingress_cidr_blocks)))
  description = lookup(var.ingress_with_cidr_blocks[count.index], "description", "Ingress Rule")
  from_port   = lookup(var.ingress_with_cidr_blocks[count.index], "from_port", var.ingress_rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")][0])
  to_port     = lookup(var.ingress_with_cidr_blocks[count.index], "to_port", var.ingress_rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")][1])
  protocol    = lookup(var.ingress_with_cidr_blocks[count.index], "protocol", var.ingress_rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")][2])
}

resource "aws_security_group_rule" "ingress_with_ipv6_cidr_blocks" {
  count = var.create ? length(var.ingress_with_ipv6_cidr_blocks) : 0

  security_group_id = aws_security_group.this[0].id
  type              = "ingress"

  ipv6_cidr_blocks = split(",", lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "ipv6_cidr_blocks", join(",", var.ingress_ipv6_cidr_blocks)))
  description      = lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "description", "Ingress Rule")
  from_port        = lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "from_port", var.ingress_rules[lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "rule", "_")][0])
  to_port          = lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "to_port", var.ingress_rules[lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "rule", "_")][1])
  protocol         = lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "protocol", var.ingress_rules[lookup(var.ingress_with_ipv6_cidr_blocks[count.index], "rule", "_")][2])
}

resource "aws_security_group_rule" "ingress_with_source_security_group_id" {
  count = var.create ? length(var.ingress_with_source_security_group_id) : 0

  security_group_id = aws_security_group.this[0].id
  type              = "ingress"

  source_security_group_id = var.ingress_with_source_security_group_id[count.index].source_security_group_id
  prefix_list_ids         = try(split(",", lookup(var.ingress_with_source_security_group_id[count.index], "prefix_list_ids", "")), [])
  description            = lookup(var.ingress_with_source_security_group_id[count.index], "description", null)

  from_port = var.ingress_with_source_security_group_id[count.index].from_port
  to_port   = var.ingress_with_source_security_group_id[count.index].to_port
  protocol  = var.ingress_with_source_security_group_id[count.index].protocol
}

resource "aws_security_group_rule" "egress_with_cidr_blocks" {
  count = var.create ? length(var.egress_with_cidr_blocks) : 0

  security_group_id = aws_security_group.this[0].id
  type              = "egress"

  cidr_blocks = split(",", lookup(var.egress_with_cidr_blocks[count.index], "cidr_blocks", join(",", var.egress_cidr_blocks)))
  description = lookup(var.egress_with_cidr_blocks[count.index], "description", "Egress Rule")
  from_port   = lookup(var.egress_with_cidr_blocks[count.index], "from_port", var.egress_rules[lookup(var.egress_with_cidr_blocks[count.index], "rule", "_")][0])
  to_port     = lookup(var.egress_with_cidr_blocks[count.index], "to_port", var.egress_rules[lookup(var.egress_with_cidr_blocks[count.index], "rule", "_")][1])
  protocol    = lookup(var.egress_with_cidr_blocks[count.index], "protocol", var.egress_rules[lookup(var.egress_with_cidr_blocks[count.index], "rule", "_")][2])
}

resource "aws_security_group_rule" "egress_with_ipv6_cidr_blocks" {
  count = var.create ? length(var.egress_with_ipv6_cidr_blocks) : 0

  security_group_id = aws_security_group.this[0].id
  type              = "egress"

  ipv6_cidr_blocks = split(",", lookup(var.egress_with_ipv6_cidr_blocks[count.index], "ipv6_cidr_blocks", join(",", var.egress_ipv6_cidr_blocks)))
  description      = lookup(var.egress_with_ipv6_cidr_blocks[count.index], "description", "Egress Rule")
  from_port        = lookup(var.egress_with_ipv6_cidr_blocks[count.index], "from_port", var.egress_rules[lookup(var.egress_with_ipv6_cidr_blocks[count.index], "rule", "_")][0])
  to_port          = lookup(var.egress_with_ipv6_cidr_blocks[count.index], "to_port", var.egress_rules[lookup(var.egress_with_ipv6_cidr_blocks[count.index], "rule", "_")][1])
  protocol         = lookup(var.egress_with_ipv6_cidr_blocks[count.index], "protocol", var.egress_rules[lookup(var.egress_with_ipv6_cidr_blocks[count.index], "rule", "_")][2])
}

resource "aws_security_group_rule" "egress_with_source_security_group_id" {
  count = var.create ? length(var.egress_with_source_security_group_id) : 0

  security_group_id = aws_security_group.this[0].id
  type              = "egress"

  source_security_group_id = var.egress_with_source_security_group_id[count.index].source_security_group_id
  prefix_list_ids         = try(split(",", lookup(var.egress_with_source_security_group_id[count.index], "prefix_list_ids", "")), [])
  description            = lookup(var.egress_with_source_security_group_id[count.index], "description", null)

  from_port = var.egress_with_source_security_group_id[count.index].from_port
  to_port   = var.egress_with_source_security_group_id[count.index].to_port
  protocol  = var.egress_with_source_security_group_id[count.index].protocol
} 