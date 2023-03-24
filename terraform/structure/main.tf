data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_key_pair" "selected" {
  key_name           = var.aws_key_pair_name
  include_public_key = true
}

resource "aws_instance" "Dockerstation" {
  ami             = data.aws_ami.ubuntu.image_id
  instance_type   = "t2.small"
  key_name        = data.aws_key_pair.selected.key_name
  security_groups = [aws_security_group.allow_ssh_web_kube_docker.name]
  associate_public_ip_address = true
  user_data = "${file("init.sh")}"

  tags = {
    Name = "Docker-station"
  }
}

resource "aws_security_group" "allow_ssh_web_kube_docker" {
  name        = "allow_ssh_web_kube_docker"
  description = "Allow access for SSH, web, kube and docker"
  dynamic "ingress" {
    for_each = ["22", "9292", "6443", "2375", "2376", "9090", "9095", "3000", "9115", "8080", "8083"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  } 

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh_web_kube_docker"
  }
}

