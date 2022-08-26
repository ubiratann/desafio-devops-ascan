variable "region" {
  type        = string
  description = "Default region to create the resources"
}

variable "instance_type" {
  type        = string
  description = "Default EC2 instance type "
}

variable "ami" {
  type        = string
  description = "Default AMI id"
}

variable "ecs_cluster_name" {
  type        = string
  description = "Name of ECS cluster"
}

variable "ecr_name" {
  type        = string
  description = "Name of ECR repository"
}

variable "key_par_name" {
  type        = string
  description = "Key par name"
}
