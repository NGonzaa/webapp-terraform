resource "aws_lb" "webapp-alb" {
  name   = "webapp-alb"
  internal   = false
  load_balancer_type = "application"
  subnets = [aws_subnet.subnet-webapp-1a.id, aws_subnet.subnet-webapp-1b.id]
  security_groups = [aws_security_group.alb-sg.id]

  tags = {
    Name = "webapp-alb"
  }
}
