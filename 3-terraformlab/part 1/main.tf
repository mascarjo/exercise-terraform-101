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
  profile = "default"
}

resource "aws_instance" "web" {
  ami = var.ami
  count = var.instance_count
  security_groups = var.security_groups[0]
  security_group_use_name_prefix = var.security_group_use_name_prefix
  user_data_base64 = var.user_data_base64
  instance_type = "t2.micro"
  tags = {
    Name = var.project_tags["Name"]
    
  }
}



# ami
# name
# project_tags
#
#
#
#
#
#