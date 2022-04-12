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
  source = "github.com:mascarjo/terraform-lab-03-simplestack.git"
  project_tags =  {
    Name       = "terraform-makevpc"
    Owner      = "Johans Mascardo"
    Purpose    = "Testing"
    CostCenter = "0001"
  }
}
