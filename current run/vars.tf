variable "instance_type" {
  default = "t2.micro"
}

variable "aws_assume_role_arn" {
  type = string
  default = "arn:aws:iam::864385758454:role/cforceops-prod-cldfrc-tfe"
}

variable "vpc_id" { 
  type = string
  default = "vpc-072f4c0dd55e6f09a"
}

variable "subnet_id" {
  type  =  list
  default = ["subnet-1a0fbe53","subnet-1581764e"]
}

variable "ec2_keypair_name" {
  default = "sep-Nico"
}

variable "availability_zones" {
  type = list
  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}

variable "delete_on_termination" {
  default = true
}

variable "res_count" {
  default = 2
}

variable "ami_id"{
  default = "ami-09d95fab7fff3776c"
}

###############################################################
## Required Tags ##
###############################################################

variable "region" {
  default = "eu-west-1"
}

variable "costcenter" {
  default = "102960"
}

variable "dataconfidentiality" {
  default = "Confidential"
}

variable "environment" {
  default = "Prod"
}

variable "teamcode" {
  default = "cldfrc"
}

variable "builtby" {
  default = "Terraform"
}

variable "teamemailaddress" {
  default = "cloudsecops@absa.co.za"
}

variable "vpc_name"{
  default= "ss"
}