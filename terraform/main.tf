

provider "aws" {

    region = "us-east-1"
  
}

resource "aws_instance" "django-server" {

    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    key_name = var.key_name

    tags = {
        Name = "Django-server"
    }

    vpc_security_group_ids = [aws_security_group.django-sg.id]

}

# isntance-ip = "44.211.152.61"


resource "aws_security_group" "django-sg" {

    name = "django-security-group"
    description = "permite SSH y HTTP"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP access (Puerto 8000)"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        name = "DjangoSecurityGroup"
    }
}