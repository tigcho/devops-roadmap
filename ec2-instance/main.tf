provider "aws" {
	region	   = var.aws_region
}

resource "aws_key_pair" "deployer" {
	key_name   = var.key_pair_name
	public_key = file(var.public_key_path)
}

resource "aws_security_group" "ec2-sg" {
	name				= "devops-ec2-sg"
	description = "Allow SSH and HTTP"

	ingress {
		description = "SSH"
		from_port		= 22
		to_port			= 22
		protocol		= "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		description = "HTTP"
		from_port		= 80
		to_port			= 80
		protocol		= "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "ec2-server" {
	ami										 = var.ami_id
	instance_type					 = var.instance_type
	key_name							 = aws_key_pair.deployer.key_name
	vpc_security_group_ids = [aws_security_group.ec2-sg.id]

	associate_public_ip_address = true

	user_data = file("user_data.sh")

	tags = {
		Name = var.instance_name
	}
}
