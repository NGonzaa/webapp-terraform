resource "aws_db_subnet_group" "webapp-subnet-group" {
  name       = "webapp-subnet-group"
  subnet_ids = [aws_subnet.subnet-webapp-1c.id, aws_subnet.subnet-webapp-1d.id]

  tags = {
    Name = "webapp-subnet-group"
  }
}

resource "aws_rds_cluster" "rds-webapp" {
  cluster_identifier  = "rds-webapp"
  db_subnet_group_name = aws_db_subnet_group.webapp-subnet-group.name
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  database_name      = "webapp-db"
  master_username    = "admin"
  master_password    = "admin123"
  engine             = "aurora-mysql"
  engine_version     = "5.7"
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 2
  identifier         = "rds-webapp-${count.index}"
  cluster_identifier = aws_rds_cluster.rds-webapp.id
  db_subnet_group_name = aws_db_subnet_group.webapp-subnet-group.name
  instance_class     = "db.t2.medium"
  engine             = aws_rds_cluster.rds-webapp.engine
  engine_version     = aws_rds_cluster.rds-webapp.engine_version
}
