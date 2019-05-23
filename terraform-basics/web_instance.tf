
resource "aws_instance" "web" {
  ami           = "ami-0b5bf80de07b6a667"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.username}-${var.label}-HelloStackX"
    Creator = "${var.username}"
    TTL = "8"
  }
}