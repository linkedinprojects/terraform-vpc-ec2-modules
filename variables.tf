variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "tag" {
  type = string
}

variable "ports" {
  type = list(number)
}
variable "SG_tag" {
  type = string
}
variable "SG_name" {
  type = string
}

// variables for VPC

variable "vpc_cidr" {
  type = string
}
variable "vpc_tag" {
  type = string
}
variable "IGW_tag" {
  type = string
}
variable "RT_cidr" {
  type = string
}
variable "RT_tag" {
  type = string
}

variable "Pub_subnet_cidr" {
  type = string
}
variable "Pub_subnet_AZ" {
  type = string
}
variable "Pub_subnet_tag" {
  type = string
}


