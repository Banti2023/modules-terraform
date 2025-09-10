aws_region            = "us-east-1"
cluster_name          = "private-eks-cluster-banti"
vpc_cidr              = "10.10.0.0/16"
public_subnets_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnets_cidrs = ["10.10.11.0/24", "10.10.12.0/24"]
availability_zones    = ["us-east-1a", "us-east-1b"]

enable_dns_hostnames = true
enable_dns_support   = true

public_route_cidr   = "0.0.0.0/0"
private_route_cidr  = "0.0.0.0/0"

node_group_instance_types = ["t2.medium"]
node_group_desired        = 2
node_group_min            = 1
node_group_max            = 3

cluster_version = "1.28"

eks_cluster_policies = [
  "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
  "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
]

eks_node_policies = [
  "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
  "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
]

endpoint_private_access  = true
endpoint_public_access   = false
public_access_cidrs      = []

enabled_cluster_log_types = ["api", "audit", "authenticator"]

ec2_ssh_key  = "my-key-pair"
ami_type     = "AL2_x86_64"

sg_name        = "private-eks-cluster-banti-workers-sg"
sg_description = "Security group for EKS worker nodes"

ingress_self_from_port   = 0
ingress_self_to_port     = 0
ingress_self_protocol    = "-1"
ingress_self_self        = true
ingress_self_description = "Allow intra-node communication"

ingress_cp_from_port    = 443
ingress_cp_to_port      = 443
ingress_cp_protocol     = "tcp"
ingress_cp_cidr_blocks  = ["10.10.0.0/16"]
ingress_cp_description  = "Allow nodes to reach control plane"

egress_from_port    = 0
egress_to_port      = 0
egress_protocol     = "-1"
egress_cidr_blocks  = ["0.0.0.0/0"]

s3_service_name      = "s3"
s3_vpc_endpoint_type = "Gateway"

interface_endpoints = [
  "ecr.api",
  "ecr.dkr",
  "sts",
  "logs",
  "ec2"
]

endpoints_sg_name        = "private-eks-cluster-banti-endpoints-sg"
endpoints_sg_description = "Security group for interface endpoints"

ingress_from_port   = 443
ingress_to_port     = 443
ingress_protocol    = "tcp"
ingress_cidr_blocks = ["10.10.0.0/16"]



interface_vpc_endpoint_type = "Interface"
private_dns_enabled         = true
