terraform {
	required_providers {
	aws = {
	source = "hashicorp/aws"
	version = "~> 4.16"
}
}

required_version =">=1.2.0"
}


provider "aws" {
	region = "ap-south-1"
}

resource "aws_instance" "my_ec2_instance" {
	ami = "ami-02eb7a4783e7e9317"
	instance_type = "t2.micro"
	tags = {
		Name = var.instance_name
}
}


resource "aws_s3_bucket" "my_s3_bucket" {
	bucket = "terraform-priyansh-s3-1234"
	tags = {
	Name = "terraform-priyansh-s3-1234"
	Environment = "Dev"
}
}





output "ec2_public_ips" {
	value = aws_instance.my_ec2_instance[*].public_ip
}
