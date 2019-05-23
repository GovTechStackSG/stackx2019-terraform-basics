// Create Internet Gateway
// https://www.terraform.io/docs/providers/aws/r/internet_gateway.html
resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = "${aws_vpc.main.id}"

    tags = {
        Name = "${var.vpc_name}.internet_gateway"
        VPC = "${var.vpc_name}"
        Owner = "${var.vpc_owner}"
    }
}

// Create Route Table for Public Subnets
// https://www.terraform.io/docs/providers/aws/r/default_route_table.html
resource "aws_route_table" "public_route_table" {
    vpc_id = "${aws_vpc.main.id}"

    tags = {
        Name = "${var.vpc_name}.route_table.public"
        VPC = "${var.vpc_name}"
        Owner = "${var.vpc_owner}"
    }
}

// https://www.terraform.io/docs/providers/aws/r/route.html
resource "aws_route" "public_ipv4" {
    route_table_id            = "${aws_route_table.public_route_table.id}"
    destination_cidr_block    = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
}

// https://www.terraform.io/docs/providers/aws/r/route.html
resource "aws_route" "public_ipv6" {
    route_table_id            = "${aws_route_table.public_route_table.id}"
    destination_ipv6_cidr_block    = "::/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
}

// Associate Public Route Table with Public Subnets

// https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "public_web_tier_ap-southeast-1a" {
    subnet_id = "${aws_subnet.web_tier_ap-southeast-1a.id}"
    route_table_id = "${aws_route_table.public_route_table.id}"
}


// https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "public_web_tier_ap-southeast-1b" {
    subnet_id = "${aws_subnet.web_tier_ap-southeast-1b.id}"
    route_table_id = "${aws_route_table.public_route_table.id}"
}



// https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "public_management_tier_ap-southeast-1a" {
    subnet_id = "${aws_subnet.management_tier_ap-southeast-1a.id}"
    route_table_id = "${aws_route_table.public_route_table.id}"
}


// https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "public_management_tier_ap-southeast-1b" {
    subnet_id = "${aws_subnet.management_tier_ap-southeast-1b.id}"
    route_table_id = "${aws_route_table.public_route_table.id}"
}


