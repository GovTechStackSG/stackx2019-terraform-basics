

locals {
    web_tier_cidr_block = "${cidrsubnet(aws_vpc.main.cidr_block, 6, 0)}"
}

// https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "web_tier_ap-southeast-1a" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${cidrsubnet(local.web_tier_cidr_block, 2, 0)}"
    availability_zone = "ap-southeast-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.vpc_name}.subnet.web_tier_ap-southeast-1a"
        Owner = "${var.vpc_owner}"
        Network_Tier = "web"
    }
}

// https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "web_tier_ap-southeast-1b" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${cidrsubnet(local.web_tier_cidr_block, 2, 1)}"
    availability_zone = "ap-southeast-1b"
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.vpc_name}.subnet.web_tier_ap-southeast-1b"
        Owner = "${var.vpc_owner}"
        Network_Tier = "web"
    }
}

locals {
    application_tier_cidr_block = "${cidrsubnet(aws_vpc.main.cidr_block, 6, 1)}"
}

// https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "application_tier_ap-southeast-1a" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${cidrsubnet(local.application_tier_cidr_block, 2, 0)}"
    availability_zone = "ap-southeast-1a"
    map_public_ip_on_launch = false

    tags = {
        Name = "${var.vpc_name}.subnet.application_tier_ap-southeast-1a"
        Owner = "${var.vpc_owner}"
        Network_Tier = "application"
    }
}

// https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "application_tier_ap-southeast-1b" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${cidrsubnet(local.application_tier_cidr_block, 2, 1)}"
    availability_zone = "ap-southeast-1b"
    map_public_ip_on_launch = false

    tags = {
        Name = "${var.vpc_name}.subnet.application_tier_ap-southeast-1b"
        Owner = "${var.vpc_owner}"
        Network_Tier = "application"
    }
}

locals {
    management_tier_cidr_block = "${cidrsubnet(aws_vpc.main.cidr_block, 6, 2)}"
}

// https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "management_tier_ap-southeast-1a" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${cidrsubnet(local.management_tier_cidr_block, 2, 0)}"
    availability_zone = "ap-southeast-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.vpc_name}.subnet.management_tier_ap-southeast-1a"
        Owner = "${var.vpc_owner}"
        Network_Tier = "management"
    }
}

// https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "management_tier_ap-southeast-1b" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${cidrsubnet(local.management_tier_cidr_block, 2, 1)}"
    availability_zone = "ap-southeast-1b"
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.vpc_name}.subnet.management_tier_ap-southeast-1b"
        Owner = "${var.vpc_owner}"
        Network_Tier = "management"
    }
}

locals {
    database_tier_cidr_block = "${cidrsubnet(aws_vpc.main.cidr_block, 6, 3)}"
}

// https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "database_tier_ap-southeast-1a" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${cidrsubnet(local.database_tier_cidr_block, 2, 0)}"
    availability_zone = "ap-southeast-1a"
    map_public_ip_on_launch = false

    tags = {
        Name = "${var.vpc_name}.subnet.database_tier_ap-southeast-1a"
        Owner = "${var.vpc_owner}"
        Network_Tier = "database"
    }
}

// https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "database_tier_ap-southeast-1b" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${cidrsubnet(local.database_tier_cidr_block, 2, 1)}"
    availability_zone = "ap-southeast-1b"
    map_public_ip_on_launch = false

    tags = {
        Name = "${var.vpc_name}.subnet.database_tier_ap-southeast-1b"
        Owner = "${var.vpc_owner}"
        Network_Tier = "database"
    }
}

