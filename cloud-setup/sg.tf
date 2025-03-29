resource "aws_security_group" "vproapp" {
  name        = "vproapp"
  description = "vproapp Security Group"

  // Ingress rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // -1 means all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}