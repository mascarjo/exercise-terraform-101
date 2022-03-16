variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  description = "AMI of image"
  default     = "ami-07eaf2ea4b73a54f6" # eu-west-2 Ubuntu-18.04"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "project_tags" {
  description = "Project tags to be used to track costs."
  type        = map(string)
  default = {
    Name       = "Instance"
    Owner      = "Sebastian Maniak"
    Purpose    = "Testing"
    CostCenter = "0002"
  }
}
