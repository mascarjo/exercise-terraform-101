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

resource "aws_security_group" "ssh" {
  name        = "public ssh"
  description = "Security Group Deployment"
  tags        = merge(var.project_tags)

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = "t2.micro"
  count = var.instance_count
  key_name = "johanspart2"
  vpc_security_group_ids = [aws_security_group.ssh.id]
  user_data_base64 = var.user_data_base64
  tags = {
    Name = var.project_tags["Name"]
  }


connection {
	
      type     = "ssh"
      user     = "ec2-user"
      private_key = file(var.key)
      host = self.public_ip
}

provisioner "file" {

    source      = "ansible-playbook.yaml"
    destination = "/tmp/ansible-playbook.yaml"
  
} 

provisioner "file" {

    source      = "ansible-getfacts.yaml"
    destination = "/tmp/ansible-getfacts.yaml"
  
}

provisioner "file" {

    source      = "./inventory/hosts.yaml"
    destination = "/tmp/inventory/hosts.yaml"
  
}

provisioner "remote-exec" {

    inline = [
                 "sudo yum install httpd -y",
                 "sudo systemctl restart httpd",
                 "sudo systemctl enable httpd"
 
             ] 
}
}