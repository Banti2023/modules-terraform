variable "vpc_id" {
  type        = string
  description = "VPC ID where endpoints are created"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name for tagging"
}

variable "s3_service_name" {
  type        = string
  description = "Service name for S3 endpoint"
  default     = "s3"
}

variable "s3_vpc_endpoint_type" {
  type        = string
  description = "Type of VPC endpoint for S3"
  default     = "Gateway"
}

variable "route_table_private_id" {
  type        = string
  description = "Route table ID for private subnets"
}

variable "route_table_public_id" {
  type        = string
  description = "Route table ID for public subnets"
}

variable "interface_endpoints" {
  type        = list(string)
  description = "List of interface endpoints to create"
  default = [
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

variable "endpoints_sg_name" {
  type        = string
  description = "Name of the security group for endpoints"
  default     = "private-eks-cluster-endpoints-sg"
}

variable "endpoints_sg_description" {
  type        = string
  description = "Description of the security group for endpoints"
  default     = "Security group for interface endpoints"
}

variable "ingress_from_port" {
  type        = number
  description = "Ingress rule from port"
  default     = 443
}

variable "ingress_to_port" {
  type        = number
  description = "Ingress rule to port"
  default     = 443
}

variable "ingress_protocol" {
  type        = string
  description = "Protocol for ingress rule"
  default     = "tcp"
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed for ingress"
  default     = ["10.10.0.0/16"]
}

variable "egress_from_port" {
  type        = number
  description = "Egress rule from port"
  default     = 0
}

variable "egress_to_port" {
  type        = number
  description = "Egress rule to port"
  default     = 0
}

variable "egress_protocol" {
  type        = string
  description = "Protocol for egress rule"
  default     = "-1"
}

variable "egress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed for egress"
  default     = ["0.0.0.0/0"]
}

variable "private_subnets_ids" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "interface_vpc_endpoint_type" {
  type        = string
  description = "Type of VPC endpoint for interface endpoints"
  default     = "Interface"
}

variable "private_dns_enabled" {
  type        = bool
  description = "Whether private DNS is enabled"
  default     = true
}
