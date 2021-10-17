// ----------- Security Group -----------
resource "aws_security_group" "test_instance_sg"{
  name        = "allow-tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    description = "HTTPS user access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "HTTP user access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH user access"
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

  tags = merge(local.tags,{"Name"="fr-${local.tags["wavestone:project"]}-sg-${var.environment}"})
}

// ------------- Servers ---------------
resource "aws_instance" "test_instance_linux"{
    ami                    = data.aws_ami.ubuntu.id
    instance_type          = "t2.micro"
    iam_instance_profile   = aws_iam_instance_profile.app.name
    user_data              = templatefile("./scripts/startup.sh", { BUCKET_NAME = var.bucket_name })
    vpc_security_group_ids = [aws_security_group.test_instance_sg.id]
    subnet_id              = aws_subnet.test_subnet.id
    key_name               = var.instance_key_pair_name

    tags = merge(local.tags,{"Name"="fr-${local.tags["wavestone:project"]}-vm-${var.environment}"})
}

output "ec2_public_dns" {
  value = aws_instance.test_instance_linux.public_dns
}

output "ec2_public_ip" {
  value = aws_instance.test_instance_linux.public_ip
}