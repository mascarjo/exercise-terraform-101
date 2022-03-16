terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "tf-stack" {
  source = "./modules/stackdemo"
  project_tags =  {
    Name       = "terraform-stackdemo"
    Owner      = "Sebastian Maniak"
    Purpose    = "Testing"
    CostCenter = "0001"
  }
}
