terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "us-west-2"
  profile = "default"
}
resource "aws_instance" "hari-first-ec2" {
  ami           = "ami-03d5c68bab01f3496"
  instance_type = "t2.micro"
  key_name = "harish_pwc"

    tags = {
    Name = "Harish"
  }
connection {
	
      type     = "ssh"
      user     = "ubuntu"
      private_key = file("harish_pwc.pem")
      host = self.public_ip
}

provisioner "file" {

    source      = "C:\Users\Dilip\Desktop\Training\Ansible Playbook.yaml"
    destination = "/tmp/"
  
} 

 provisioner "remote-exec" {

    inline = [
                 "sudo apt update",
                  "sudo apt install ansible",
	          "sudo systemctl start ansible",
 
             ] 
}

provisioner "remote-exec" {

    inline = [

                  "ansible all -a "df -h" -u root",
             ] 
}

}