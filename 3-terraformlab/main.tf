terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "name" {
  description = "Name of EC2 instance"
  default     = "myinstance"
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = var.name
  }
}

variable "ami" {
  description = "Amazon Machine Image"
  default = "ami-07eaf2ea4b73a54f6"
}

variable "name" {
  description = "I like names"
  
}
