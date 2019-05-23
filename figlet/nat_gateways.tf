// Create NAT Gateways for Private Subnets

// https://www.terraform.io/docs/providers/aws/r/eip.html
resource "aws_eip" "ap-southeast-1a_nat_gateway" {
    vpc = true

    tags = {
        Name = "${var.vpc_name}.eip.ap-southeast-1a_nat_gateway"
        VPC = "${var.vpc_name}"
        Owner = "${var.vpc_owner}"
    }
}

// https://www.terraform.io/docs/providers/aws/r/eip.html
resource "aws_eip" "ap-southeast-1b_nat_gateway" {
    vpc = true

    tags = {
        Name = "${var.vpc_name}.eip.ap-southeast-1b_nat_gateway"
        VPC = "${var.vpc_name}"
        Owner = "${var.vpc_owner}"
    }
}

// https://www.terraform.io/docs/providers/aws/r/nat_gateway.html
resource "aws_nat_gateway" "private_ap-southeast-1a" {
    allocation_id = "${aws_eip.ap-southeast-1a_nat_gateway.id}"
    subnet_id = "${aws_subnet.web_tier_ap-southeast-1a.id}"
    depends_on = ["aws_internet_gateway.internet_gateway"]

    tags = {
        Name = "${var.vpc_name}.nat_gateway.ap-southeast-1a"
        VPC = "${var.vpc_name}"
        Owner = "${var.vpc_owner}"
    }
}

// https://www.terraform.io/docs/providers/aws/r/nat_gateway.html
resource "aws_nat_gateway" "private_ap-southeast-1b" {
    allocation_id = "${aws_eip.ap-southeast-1b_nat_gateway.id}"
    subnet_id = "${aws_subnet.web_tier_ap-southeast-1b.id}"
    depends_on = ["aws_internet_gateway.internet_gateway"]

    tags = {
        Name = "${var.vpc_name}.nat_gateway.ap-southeast-1b"
        VPC = "${var.vpc_name}"
        Owner = "${var.vpc_owner}"
    }
}

// https://www.terraform.io/docs/providers/aws/r/route_table.html
resource "aws_route_table" "private_ap-southeast-1a" {
    vpc_id = "${aws_vpc.main.id}"

    tags = {
        Name = "${var.vpc_name}.route_table.private_ap-southeast-1a"
        VPC = "${var.vpc_name}"
        Owner = "${var.vpc_owner}"
    }
}

// https://www.terraform.io/docs/providers/aws/r/route_table.html
resource "aws_route_table" "private_ap-southeast-1b" {
    vpc_id = "${aws_vpc.main.id}"

    tags = {
        Name = "${var.vpc_name}.route_table.private_ap-southeast-1b"
        VPC = "${var.vpc_name}"
        Owner = "${var.vpc_owner}"
    }
}

// https://www.terraform.io/docs/providers/aws/r/route.html
resource "aws_route" "private_ap-southeast-1a_ipv4" {
    route_table_id            = "${aws_route_table.private_ap-southeast-1a.id}"
    destination_cidr_block    = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.private_ap-southeast-1a.id}"
}

// https://www.terraform.io/docs/providers/aws/r/route.html
resource "aws_route" "private_ap-southeast-1b_ipv4" {
    route_table_id            = "${aws_route_table.private_ap-southeast-1b.id}"
    destination_cidr_block    = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.private_ap-southeast-1b.id}"
}

// Associate NAT Route Tables with Private Subnets

// https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "application_tier_ap-southeast-1a" {
    subnet_id = "${aws_subnet.application_tier_ap-southeast-1a.id}"
    route_table_id = "${aws_route_table.private_ap-southeast-1a.id}"
}

// https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "database_tier_ap-southeast-1a" {
    subnet_id = "${aws_subnet.database_tier_ap-southeast-1a.id}"
    route_table_id = "${aws_route_table.private_ap-southeast-1a.id}"
}

// https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "application_tier_ap-southeast-1b" {
    subnet_id = "${aws_subnet.application_tier_ap-southeast-1b.id}"
    route_table_id = "${aws_route_table.private_ap-southeast-1b.id}"
}

// https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "database_tier_ap-southeast-1b" {
    subnet_id = "${aws_subnet.database_tier_ap-southeast-1b.id}"
    route_table_id = "${aws_route_table.private_ap-southeast-1b.id}"
}
