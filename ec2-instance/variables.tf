variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "key_pair_name" {
  description = "Name of existing key pair"
  type        = string
}

variable "public_key_path" {
  description = "Path to public key"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Server AMI ID"
  type        = string
}

variable "instance_name" {
  description = "Name of EC2 instance"
  type        = string
  default     = "devops-ec2"
}
