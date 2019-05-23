data "aws_ami" "web"{
  filter {
    name = "name"
    values = [
      "stackx2019-figlet-app.*"]
  }
  most_recent = true
  owners = ["self"]
}


resource "aws_instance" "web" {
  ami           = "${data.aws_ami.web.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.username}-${var.label}-HelloStackX"
    Creator = "${var.username}"
    TTL = "8"
  }
}