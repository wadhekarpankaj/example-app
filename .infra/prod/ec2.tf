resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  subnet_id              = var.subnet_id
  user_data              = file("./userdata/user_data.sh")
  iam_instance_profile   = aws_iam_instance_profile.ec2_s3_access_profile.name
  key_name               = var.key_name

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name      = "app-webserver"
    Terraform = "true"
  }
}


resource "aws_security_group" "webserver_sg" {
  name        = "webserver-sg"
  description = "Allow inbound traffic to webserver"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
    Name      = "webserver-sg"
    Terraform = "true"
  }
}