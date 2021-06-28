resource "aws_instance" "webapp-server-1" {
    ami                 = var.ami
    instance_type       = var.instance_type
    key_name            = var.key-name
    vpc_security_group_ids = [aws_security_group.ec2-sg.id]
    subnet_id = aws_subnet.subnet-webapp-1a.id
    tags = {
        Name        = "webapp-server-1"
        terraform   = "True"
    }
}

resource "aws_instance" "webapp-server-2" {
    ami                 = var.ami
    instance_type       = var.instance_type
    key_name            = var.key-name
    vpc_security_group_ids = [aws_security_group.ec2=sg.id]
    subnet_id = aws_subnet.subnet-webapp-1b.id
    tags = {
        Name        = "webapp-server-2"
        terraform   = "True"
    }
}
