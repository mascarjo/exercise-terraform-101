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

module "tf-stack" {
  source = "github.com:<yourrepo>/terraform-lab-03-simplestack.git"
  project_tags =  {
    Name       = "terraform-stackdemo"
    Owner      = "Sebastian Maniak"
    Purpose    = "Testing"
    CostCenter = "0001"
  }
}
