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
  profile = "default"
}
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = var.project_tags["Name"]
    ami = var.ami
    count = var.instance_count
    key_name = "lab1key"
    security_groups = var.security_groups[0]
    security_group_use_name_prefix = var.security_group_use_name_prefix
    user_data_base64 = var.user_data_base64
  }


connection {
	
      type     = "ssh"
      user     = "ec2-user"
      private_key = file("./lab1key.pem")
      host = self.public_ip
}

provisioner "file" {

    source      = "C:/Users/johan/Downloads/ansible-playbook.yaml"
    destination = "/tmp/ansible-playbook.yaml"
  
} 

provisioner "remote-exec" {

    inline = [
                 "sudo amazon-linux-extras enable ansible2",
                 "sudo yum install -y ansible"
 
             ] 
}

provisioner "remote-exec" {

    inline = [

                  "ansible all -a \"df -h\" -u root",
             ] 
}
}