variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "route_table_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-0c02fb55956c7d316" # Amazon Linux 2
}

variable "bastion_sg_name" {
  type    = string
  default = "bastion-sg"
}
