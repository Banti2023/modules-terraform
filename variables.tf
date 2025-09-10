variable "aws_region" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets_cidrs" {
  type = list(string)
}

variable "private_subnets_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "enable_dns_support" {
  type = bool
}

variable "public_route_cidr" {
  type = string
}

variable "private_route_cidr" {
  type = string
}

# --- Security Group for Workers ---
variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}

variable "ingress_self_protocol" {
  type = string
}

variable "ingress_self_from_port" {
  type = number
}

variable "ingress_self_to_port" {
  type = number
}

variable "ingress_self_self" {
  type = bool
}

variable "ingress_self_description" {
  type = string
}

variable "ingress_cp_protocol" {
  type = string
}

variable "ingress_cp_from_port" {
  type = number
}

variable "ingress_cp_to_port" {
  type = number
}

variable "ingress_cp_cidr_blocks" {
  type = list(string)
}

variable "ingress_cp_description" {
  type = string
}

variable "egress_from_port" {
  type = number
}

variable "egress_to_port" {
  type = number
}

variable "egress_protocol" {
  type = string
}

variable "egress_cidr_blocks" {
  type = list(string)
}

# --- Common Tags ---
variable "tags" {
  type = map(string)
  default = {}
}

# --- EKS IAM Policies ---
variable "eks_cluster_policies" {
  type = list(string)
}

variable "eks_node_policies" {
  type = list(string)
}

# --- EKS Cluster & Node Group ---
variable "cluster_version" {
  type = string
}

variable "node_group_instance_types" {
  type = list(string)
}

variable "node_group_desired" {
  type = number
}

variable "node_group_min" {
  type = number
}

variable "node_group_max" {
  type = number
}

variable "node_group_tags" {
  type = map(string)
}

variable "ec2_ssh_key" {
  type = string
}

variable "ami_type" {
  type = string
}

# --- EKS Cluster Networking ---
variable "endpoint_private_access" {
  type = bool
}

variable "endpoint_public_access" {
  type = bool
}

variable "public_access_cidrs" {
  type = list(string)
}

variable "enabled_cluster_log_types" {
  type = list(string)
}

# --- VPC Endpoints ---
variable "s3_service_name" {
  type = string
}

variable "s3_vpc_endpoint_type" {
  type = string
}

variable "interface_endpoints" {
  type = list(string)
}

variable "interface_vpc_endpoint_type" {
  type = string
}

variable "private_dns_enabled" {
  type = bool
}

variable "endpoints_sg_name" {
  type = string
}

variable "endpoints_sg_description" {
  type = string
}

variable "ingress_from_port" {
  type = number
}

variable "ingress_to_port" {
  type = number
}

variable "ingress_protocol" {
  type = string
}

variable "ingress_cidr_blocks" {
  type = list(string)
}
