resource "aws_key_pair" "my_key" {
  key_name   = "my-key-pair"
  public_key = file("./my-key-pair.pub")
}
