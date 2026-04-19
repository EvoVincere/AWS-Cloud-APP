resource "aws_security_group" "app_sg" {
    name = "cloud-app-sg"
    description = "For Allow SSH, HTTP, HTTPS"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 9090
        to_port = 9090
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "app_server" {
    ami = "ami-0a1f2a2b7f1090c4d"
    instance_type = "t3.micro"

    vpc_security_group_ids = [aws_security_group.app_sg.id]
    key_name = "ssh-key"

    tags = {
        Name = "cloud-app-server"
        Environment = "dev"
        Project = var.project_name
    }
}

resource "aws_eip" "my_eip" {
  domain = "vpc"

  tags = {
    Name = "cloud-app-eip"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.app_server.id
  allocation_id = aws_eip.my_eip.id
}