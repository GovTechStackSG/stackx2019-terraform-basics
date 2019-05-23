resource "aws_key_pair" "stackx2019-training" {
  public_key = "${file("~/.ssh/stackx2019-training.pub")}"
}