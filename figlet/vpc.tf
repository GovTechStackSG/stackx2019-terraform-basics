// https://www.terraform.io/docs/providers/aws/r/vpc.html
resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr_block}"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.vpc_name}"
    Owner = "${var.vpc_owner}"
  }
}

