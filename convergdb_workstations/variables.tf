variable "instance_count" {
  default = 1
}

variable "ami_id" {
  default = "ami-02c4f4b3bf69c46ed"
}

variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-7c13aa04"
}

variable "subnet_id" {
  default = "subnet-e76f90ba"
}

variable "key_name" {
  default = "jeremy-convergdb-us-east-1"
}