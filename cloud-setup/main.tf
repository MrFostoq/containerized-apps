provider "aws" {
  region = var.region
}

resource "aws_instance" "vproapp" {
  ami             = "ami-071226ecf16aa7d96" # amazon linux
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
              sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose
              sudo yum install git -y
              git clone https://github.com/hkhcoder/vprofile-project.git
              EOF

  tags = {
    Name = "vproapp-instance"
  }
}

