
resource "aws_instance" "S1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.SG.id]
  subnet_id              = var.subnet_id
  # Associate a public IP address
  associate_public_ip_address = true
  # Reference the user_data file
    user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install apache2 -y
              systemctl start apache2
              systemctl enable apache2
              # Removing custom HTML and serving default Apache2 Ubuntu page
              EOF

  tags = {
    Name = var.tag
  }
}




//creating security group
resource "aws_security_group" "SG" {
  name        = var.SG_name
  description = "Allow TLS inbound traffic"
   vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
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
    Name = var.SG_tag
  }
}

