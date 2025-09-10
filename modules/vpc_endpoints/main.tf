##########################
# S3 Gateway Endpoint
##########################
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [var.route_table_private_id, var.route_table_public_id]

  tags = {
    Name = "${var.cluster_name}-s3-endpoint"
  }
}

##########################
# Security Group for Interface Endpoints
##########################
resource "aws_security_group" "endpoints_sg" {
  name        = var.endpoints_sg_name
  description = var.endpoints_sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_blocks
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  tags = {
    Name = var.endpoints_sg_name
  }
}

##########################
# Local variable for 33 interface endpoints
##########################
locals {
  interface_endpoints = [
    "ec2",
    "ecr.api",
    "ecr.dkr",
    "logs",
    "sts",
    "ssm",
    "kms",
    "cloudwatch",
    "autoscaling",
    "elasticloadbalancing",
    "sns",
    "sqs",
    "lambda",
    "cloudformation",
    "cloudtrail",
    "config",
    "dynamodb",
    "secretsmanager",
    "athena",
    "glue",
    "elasticache",
    "rds",
    "apigateway",
    "sagemaker",
    "batch",
    "elasticfilesystem",
    "cloudfront",
    "elasticbeanstalk",
    "kinesis",
    "xray",
    "codebuild",
    "codedeploy"
  ]
}

##########################
# Interface Endpoints
##########################
resource "aws_vpc_endpoint" "interface_endpoints" {
  for_each            = toset(local.interface_endpoints)
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.${each.key}"
  vpc_endpoint_type   = var.interface_vpc_endpoint_type
  subnet_ids          = var.private_subnets_ids
  security_group_ids  = [aws_security_group.endpoints_sg.id]
  private_dns_enabled = var.private_dns_enabled

  tags = {
    Name = "${var.cluster_name}-${each.key}-endpoint"
  }
}
