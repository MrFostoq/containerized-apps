
resource "aws_instance" "vproapp" {
  ami             = data.aws_ami.latest_amazon_linux.id # Dynamic AMI
  instance_type   = var.instance_type
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.vproapp.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y docker
              sudo systemctl enable docker
              sudo systemctl start docker
              sudo usermod -aG docker ec2-user
              sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose
              sudo yum install git -y
              sudo git clone https://github.com/MrFostoq/containerized-apps.git
              EOF

  tags = {
    Name = "vproapp-instance"
  }
}

