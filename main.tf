# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
terraform {
  required_providers {
    aws      = "~> 2.0"
    template = "~> 2.1"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "template_file" "install_jenkins" {
  template = "${file("${path.module}/install_jenkins.tpl")}"
  vars = {
    jenkins_port = var.jenkins_port
  }
}

resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = var.ssh_key_name
  vpc_security_group_ids = [aws_security_group.jenkins_ssh.id, aws_security_group.jenkins_web.id]

  user_data = data.template_file.install_jenkins.rendered

  tags = {
    Name = "${var.name_prefix}jenkins-server${var.name_suffix}"
  }

  iam_instance_profile = var.iam_instance_profile
}

#
# Elastic IP
#
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.jenkins.id
  allocation_id = aws_eip.jenkins.id
}

resource "aws_eip" "jenkins" {
  vpc = true
}


#
# Security Groups
#
resource "aws_security_group" "jenkins_web" {
  name = "${var.name_prefix}jenkins-web${var.name_suffix}"
  ingress {
    from_port   = var.jenkins_port
    to_port     = var.jenkins_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}jenkins-web${var.name_suffix}"
  }
}

resource "aws_security_group" "jenkins_ssh" {
  name = "${var.name_prefix}jenkins-ssh${var.name_suffix}"
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

  tags = {
    Name = "${var.name_prefix}jenkins-ssh${var.name_suffix}"
  }
}
