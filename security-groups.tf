resource "aws_security_group" "ec2-sg" {
  name        = "ec2-sg"
  description = "SG para EC2"
  vpc_id      = aws_vpc.webapp-vpc.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from public"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  tags = {
    Name = "ec2-sg"
  }
}

resource "aws_security_group" "alb-sg" {
  name        = "alb-sg"
  description = "SG para ALB"
  vpc_id      = aws_vpc.webapp-vpc.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "HTTP to EC2"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.sg-ec2.id]
  }

  tags = {
    Name = "alb-sg"
  }
}

resource "aws_security_group" "rds-sg" {
  name        = "rds-sg"
  description = "SG para RDS"
  vpc_id      = aws_vpc.webapp-vpc.id

  ingress {
    description      = "MySQL/Aurora from EC2"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.sg-ec2.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  tags = {
    Name = "rds-sg"
  }
}

resource "aws_security_group" "efs-sg" {
  name        = "efs-sg"
  description = "SG para EFS"
  vpc_id      = aws_vpc.webapp-vpc.id

  ingress {
    description      = "TCP from public"
    from_port        = 2049
    to_port          = 2049
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  tags = {
    Name = "efs-sg"
  }
}
