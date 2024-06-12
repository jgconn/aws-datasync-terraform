resource "aws_security_group" "ec2_sg" {
  name        = var.security_group_name
  description = "Allow traffic for EC2 instances"
  vpc_id      = var.vpc_id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_security_group" "efs_sg" {
  name        = "efs-sg"
  description = "Allos inbound efs traffic from ec2"
  vpc_id      = var.vpc_id

  ingress {
    security_groups = [aws_security_group.ec2_sg.id]
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
  }

  egress {
    security_groups = [aws_security_group.ec2_sg.id]
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
  }
}
