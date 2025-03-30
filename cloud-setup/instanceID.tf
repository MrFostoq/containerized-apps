provider "aws" {
  region = "us-east-1" # Change to your desired region
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"] # Official AWS AMIs

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # Amazon Linux 2 AMI pattern
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}