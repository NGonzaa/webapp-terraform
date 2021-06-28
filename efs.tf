resource "aws_efs_file_system" "webapp-efs" {
  creation_token = "webapp-efs"
  availability_zone_name = "us-east-1b"

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
  tags = {
    Name = "webapp-efs"
  }
}

resource "aws_efs_mount_target" "webapp-mt" {
  file_system_id = aws_efs_file_system.webapp-efs.id
  subnet_id      = aws_subnet.subnet-webapp-1c.id
  security_groups = [aws_security_group.efs-sg.id]
}
