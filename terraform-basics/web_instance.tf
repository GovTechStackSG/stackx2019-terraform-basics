
resource "aws_instance" "web" {
  ami           = "ami-0b5a47f8865280111"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.label}-HelloStackX"
    Creator = "${var.username}"
    TTL = "8"
  }
}