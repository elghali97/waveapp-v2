// ----------- GLOBAL -----------
variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "project_name" {
  type    = string
  default = "wavestone-project"
}

// ----------- VPC -----------
variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_availability_zone" {
  type    = string
  default = "eu-west-1a"
}

variable "subnet_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

// ----------- KEY PAIR -----------
variable "instance_key_pair_name" {
  type    = string
  default = "my-ssh-key"
}

// ----------- BUCKET S3 -----------
variable "bucket_name" {
  type    = string
  default = "container-webapp-bucket"
}

// ----------- LOCALS -----------
locals {
  tags = {
    "wavestone:deployment" = "terraform",
    "wavestone:region"     = var.region,
    "wavestone:env"        = var.environment,
    "wavestone:project"    = var.project_name
  }
}