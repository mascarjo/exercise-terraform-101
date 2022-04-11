terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = var.name
  }
}

# ami
# name
#
#
#
#
#
#
#