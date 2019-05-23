// NOTE: Each region can contain up to 10000 network ACLs and each network ACL can contain up to 60 ingress rules and 60 egress rules
// https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html

// https://www.terraform.io/docs/providers/aws/r/security_group.html
resource "aws_security_group" "web_tier" {
    name = "${var.vpc_name}.security_group.web_tier"
    description = "${var.vpc_name} web tier Security Group"
    vpc_id = "${aws_vpc.main.id}"

    tags = {
        Name = "${var.vpc_name}.security_group.web_tier"
        Owner = "${var.vpc_owner}"
        Network_Tier = "web"
    }
}

locals {
    security_group_web_https_ingress_from_cidr_blocks = "${flatten(list(
        "0.0.0.0/0"
    ))}"
}

// https://www.terraform.io/docs/providers/aws/r/security_group_rule.html
resource "aws_security_group_rule" "web_https_ingress_from_cidr_blocks" {
    count = "${length(local.security_group_web_https_ingress_from_cidr_blocks) > 0 ? 1 : 0}"
    security_group_id = "${aws_security_group.web_tier.id}"
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = "${local.security_group_web_https_ingress_from_cidr_blocks}"
}

// https://www.terraform.io/docs/providers/aws/r/security_group_rule.html
resource "aws_security_group_rule" "web_all_ingress_from_web" {
    security_group_id = "${aws_security_group.web_tier.id}"
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    source_security_group_id = "${aws_security_group.web_tier.id}"
}

// https://www.terraform.io/docs/providers/aws/r/security_group_rule.html
resource "aws_security_group_rule" "web_ssh_ingress_from_management" {
    security_group_id = "${aws_security_group.web_tier.id}"
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = "${aws_security_group.management_tier.id}"
}

// https://www.terraform.io/docs/providers/aws/r/security_group_rule.html
resource "aws_security_group_rule" "web_https_egress_to_application" {
    security_group_id = "${aws_security_group.web_tier.id}"
    type = "egress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    source_security_group_id = "${aws_security_group.application_tier.id}"
}

// https://www.terraform.io/docs/providers/aws/r/security_group_rule.html
resource "aws_security_group_rule" "web_all_egress_to_web" {
    security_group_id = "${aws_security_group.web_tier.id}"
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    source_security_group_id = "${aws_security_group.web_tier.id}"
}

locals {
    security_group_web_all_egress_to_cidr_blocks = "${flatten(list(
        "0.0.0.0/0"
    ))}"
}

// https://www.terraform.io/docs/providers/aws/r/security_group_rule.html
resource "aws_security_group_rule" "web_all_egress_to_cidr_blocks" {
    count = "${length(local.security_group_web_all_egress_to_cidr_blocks) > 0 ? 1 : 0}"
    security_group_id = "${aws_security_group.web_tier.id}"
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = "${local.security_group_web_all_egress_to_cidr_blocks}"
}
