

output "vpc_arn" {
	value = "${aws_vpc.main.arn}"
}

output "vpc_assign_generated_ipv6_cidr_block" {
	value = "${aws_vpc.main.assign_generated_ipv6_cidr_block}"
}

output "vpc_cidr_block" {
	value = "${aws_vpc.main.cidr_block}"
}

output "vpc_default_network_acl_id" {
	value = "${aws_vpc.main.default_network_acl_id}"
}

output "vpc_default_route_table_id" {
	value = "${aws_vpc.main.default_route_table_id}"
}

output "vpc_default_security_group_id" {
	value = "${aws_vpc.main.default_security_group_id}"
}

output "vpc_enable_classiclink" {
	value = "${aws_vpc.main.enable_classiclink}"
}

output "vpc_enable_classiclink_dns_support" {
	value = "${aws_vpc.main.enable_classiclink_dns_support}"
}

output "vpc_enable_dns_hostnames" {
	value = "${aws_vpc.main.enable_dns_hostnames}"
}

output "vpc_enable_dns_support" {
	value = "${aws_vpc.main.enable_dns_support}"
}

output "vpc_id" {
	value = "${aws_vpc.main.id}"
}

output "vpc_instance_tenancy" {
	value = "${aws_vpc.main.instance_tenancy}"
}

output "vpc_ipv6_association_id" {
	value = "${aws_vpc.main.ipv6_association_id}"
}

output "vpc_ipv6_cidr_block" {
	value = "${aws_vpc.main.ipv6_cidr_block}"
}

output "vpc_main_route_table_id" {
	value = "${aws_vpc.main.main_route_table_id}"
}

output "vpc_owner_id" {
	value = "${aws_vpc.main.owner_id}"
}

output "vpc_tags" {
	value = "${aws_vpc.main.tags}"
}


output "security_group_web_tier_arn" {
	value = "${aws_security_group.web_tier.arn}"
}

output "security_group_web_tier_description" {
	value = "${aws_security_group.web_tier.description}"
}

output "security_group_web_tier_egress" {
	value = "${aws_security_group.web_tier.egress}"
}

output "security_group_web_tier_id" {
	value = "${aws_security_group.web_tier.id}"
}

output "security_group_web_tier_ingress" {
	value = "${aws_security_group.web_tier.ingress}"
}

output "security_group_web_tier_name" {
	value = "${aws_security_group.web_tier.name}"
}

output "security_group_web_tier_owner_id" {
	value = "${aws_security_group.web_tier.owner_id}"
}

output "security_group_web_tier_revoke_rules_on_delete" {
	value = "${aws_security_group.web_tier.revoke_rules_on_delete}"
}

output "security_group_web_tier_tags" {
	value = "${aws_security_group.web_tier.tags}"
}

output "security_group_web_tier_vpc_id" {
	value = "${aws_security_group.web_tier.vpc_id}"
}


output "security_group_application_tier_arn" {
	value = "${aws_security_group.application_tier.arn}"
}

output "security_group_application_tier_description" {
	value = "${aws_security_group.application_tier.description}"
}

output "security_group_application_tier_egress" {
	value = "${aws_security_group.application_tier.egress}"
}

output "security_group_application_tier_id" {
	value = "${aws_security_group.application_tier.id}"
}

output "security_group_application_tier_ingress" {
	value = "${aws_security_group.application_tier.ingress}"
}

output "security_group_application_tier_name" {
	value = "${aws_security_group.application_tier.name}"
}

output "security_group_application_tier_owner_id" {
	value = "${aws_security_group.application_tier.owner_id}"
}

output "security_group_application_tier_revoke_rules_on_delete" {
	value = "${aws_security_group.application_tier.revoke_rules_on_delete}"
}

output "security_group_application_tier_tags" {
	value = "${aws_security_group.application_tier.tags}"
}

output "security_group_application_tier_vpc_id" {
	value = "${aws_security_group.application_tier.vpc_id}"
}


output "security_group_management_tier_arn" {
	value = "${aws_security_group.management_tier.arn}"
}

output "security_group_management_tier_description" {
	value = "${aws_security_group.management_tier.description}"
}

output "security_group_management_tier_egress" {
	value = "${aws_security_group.management_tier.egress}"
}

output "security_group_management_tier_id" {
	value = "${aws_security_group.management_tier.id}"
}

output "security_group_management_tier_ingress" {
	value = "${aws_security_group.management_tier.ingress}"
}

output "security_group_management_tier_name" {
	value = "${aws_security_group.management_tier.name}"
}

output "security_group_management_tier_owner_id" {
	value = "${aws_security_group.management_tier.owner_id}"
}

output "security_group_management_tier_revoke_rules_on_delete" {
	value = "${aws_security_group.management_tier.revoke_rules_on_delete}"
}

output "security_group_management_tier_tags" {
	value = "${aws_security_group.management_tier.tags}"
}

output "security_group_management_tier_vpc_id" {
	value = "${aws_security_group.management_tier.vpc_id}"
}


output "security_group_database_tier_arn" {
	value = "${aws_security_group.database_tier.arn}"
}

output "security_group_database_tier_description" {
	value = "${aws_security_group.database_tier.description}"
}

output "security_group_database_tier_egress" {
	value = "${aws_security_group.database_tier.egress}"
}

output "security_group_database_tier_id" {
	value = "${aws_security_group.database_tier.id}"
}

output "security_group_database_tier_ingress" {
	value = "${aws_security_group.database_tier.ingress}"
}

output "security_group_database_tier_name" {
	value = "${aws_security_group.database_tier.name}"
}

output "security_group_database_tier_owner_id" {
	value = "${aws_security_group.database_tier.owner_id}"
}

output "security_group_database_tier_revoke_rules_on_delete" {
	value = "${aws_security_group.database_tier.revoke_rules_on_delete}"
}

output "security_group_database_tier_tags" {
	value = "${aws_security_group.database_tier.tags}"
}

output "security_group_database_tier_vpc_id" {
	value = "${aws_security_group.database_tier.vpc_id}"
}

output "web_tier_cidr_block" {
	value = "${local.web_tier_cidr_block}"
}

output "subnet_web_tier_ap-southeast-1a_arn" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.arn}"
}

output "subnet_web_tier_ap-southeast-1a_assign_ipv6_address_on_creation" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.assign_ipv6_address_on_creation}"
}

output "subnet_web_tier_ap-southeast-1a_availability_zone" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.availability_zone}"
}

output "subnet_web_tier_ap-southeast-1a_availability_zone_id" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.availability_zone_id}"
}

output "subnet_web_tier_ap-southeast-1a_cidr_block" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.cidr_block}"
}

output "subnet_web_tier_ap-southeast-1a_id" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.id}"
}

output "subnet_web_tier_ap-southeast-1a_ipv6_cidr_block" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.ipv6_cidr_block}"
}

output "subnet_web_tier_ap-southeast-1a_ipv6_cidr_block_association_id" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.ipv6_cidr_block_association_id}"
}

output "subnet_web_tier_ap-southeast-1a_map_public_ip_on_launch" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.map_public_ip_on_launch}"
}

output "subnet_web_tier_ap-southeast-1a_owner_id" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.owner_id}"
}

output "subnet_web_tier_ap-southeast-1a_tags" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.tags}"
}

output "subnet_web_tier_ap-southeast-1a_vpc_id" {
	value = "${aws_subnet.web_tier_ap-southeast-1a.vpc_id}"
}

output "subnet_web_tier_ap-southeast-1b_arn" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.arn}"
}

output "subnet_web_tier_ap-southeast-1b_assign_ipv6_address_on_creation" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.assign_ipv6_address_on_creation}"
}

output "subnet_web_tier_ap-southeast-1b_availability_zone" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.availability_zone}"
}

output "subnet_web_tier_ap-southeast-1b_availability_zone_id" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.availability_zone_id}"
}

output "subnet_web_tier_ap-southeast-1b_cidr_block" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.cidr_block}"
}

output "subnet_web_tier_ap-southeast-1b_id" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.id}"
}

output "subnet_web_tier_ap-southeast-1b_ipv6_cidr_block" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.ipv6_cidr_block}"
}

output "subnet_web_tier_ap-southeast-1b_ipv6_cidr_block_association_id" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.ipv6_cidr_block_association_id}"
}

output "subnet_web_tier_ap-southeast-1b_map_public_ip_on_launch" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.map_public_ip_on_launch}"
}

output "subnet_web_tier_ap-southeast-1b_owner_id" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.owner_id}"
}

output "subnet_web_tier_ap-southeast-1b_tags" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.tags}"
}

output "subnet_web_tier_ap-southeast-1b_vpc_id" {
	value = "${aws_subnet.web_tier_ap-southeast-1b.vpc_id}"
}

output "subnet_web_tier_ids" {
    value = [
        "${aws_subnet.web_tier_ap-southeast-1a.id}",
        "${aws_subnet.web_tier_ap-southeast-1b.id}"
    ]
}

output "application_tier_cidr_block" {
	value = "${local.application_tier_cidr_block}"
}

output "subnet_application_tier_ap-southeast-1a_arn" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.arn}"
}

output "subnet_application_tier_ap-southeast-1a_assign_ipv6_address_on_creation" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.assign_ipv6_address_on_creation}"
}

output "subnet_application_tier_ap-southeast-1a_availability_zone" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.availability_zone}"
}

output "subnet_application_tier_ap-southeast-1a_availability_zone_id" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.availability_zone_id}"
}

output "subnet_application_tier_ap-southeast-1a_cidr_block" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.cidr_block}"
}

output "subnet_application_tier_ap-southeast-1a_id" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.id}"
}

output "subnet_application_tier_ap-southeast-1a_ipv6_cidr_block" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.ipv6_cidr_block}"
}

output "subnet_application_tier_ap-southeast-1a_ipv6_cidr_block_association_id" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.ipv6_cidr_block_association_id}"
}

output "subnet_application_tier_ap-southeast-1a_map_public_ip_on_launch" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.map_public_ip_on_launch}"
}

output "subnet_application_tier_ap-southeast-1a_owner_id" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.owner_id}"
}

output "subnet_application_tier_ap-southeast-1a_tags" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.tags}"
}

output "subnet_application_tier_ap-southeast-1a_vpc_id" {
	value = "${aws_subnet.application_tier_ap-southeast-1a.vpc_id}"
}

output "subnet_application_tier_ap-southeast-1b_arn" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.arn}"
}

output "subnet_application_tier_ap-southeast-1b_assign_ipv6_address_on_creation" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.assign_ipv6_address_on_creation}"
}

output "subnet_application_tier_ap-southeast-1b_availability_zone" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.availability_zone}"
}

output "subnet_application_tier_ap-southeast-1b_availability_zone_id" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.availability_zone_id}"
}

output "subnet_application_tier_ap-southeast-1b_cidr_block" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.cidr_block}"
}

output "subnet_application_tier_ap-southeast-1b_id" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.id}"
}

output "subnet_application_tier_ap-southeast-1b_ipv6_cidr_block" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.ipv6_cidr_block}"
}

output "subnet_application_tier_ap-southeast-1b_ipv6_cidr_block_association_id" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.ipv6_cidr_block_association_id}"
}

output "subnet_application_tier_ap-southeast-1b_map_public_ip_on_launch" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.map_public_ip_on_launch}"
}

output "subnet_application_tier_ap-southeast-1b_owner_id" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.owner_id}"
}

output "subnet_application_tier_ap-southeast-1b_tags" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.tags}"
}

output "subnet_application_tier_ap-southeast-1b_vpc_id" {
	value = "${aws_subnet.application_tier_ap-southeast-1b.vpc_id}"
}

output "subnet_application_tier_ids" {
    value = [
        "${aws_subnet.application_tier_ap-southeast-1a.id}",
        "${aws_subnet.application_tier_ap-southeast-1b.id}"
    ]
}

output "management_tier_cidr_block" {
	value = "${local.management_tier_cidr_block}"
}

output "subnet_management_tier_ap-southeast-1a_arn" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.arn}"
}

output "subnet_management_tier_ap-southeast-1a_assign_ipv6_address_on_creation" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.assign_ipv6_address_on_creation}"
}

output "subnet_management_tier_ap-southeast-1a_availability_zone" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.availability_zone}"
}

output "subnet_management_tier_ap-southeast-1a_availability_zone_id" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.availability_zone_id}"
}

output "subnet_management_tier_ap-southeast-1a_cidr_block" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.cidr_block}"
}

output "subnet_management_tier_ap-southeast-1a_id" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.id}"
}

output "subnet_management_tier_ap-southeast-1a_ipv6_cidr_block" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.ipv6_cidr_block}"
}

output "subnet_management_tier_ap-southeast-1a_ipv6_cidr_block_association_id" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.ipv6_cidr_block_association_id}"
}

output "subnet_management_tier_ap-southeast-1a_map_public_ip_on_launch" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.map_public_ip_on_launch}"
}

output "subnet_management_tier_ap-southeast-1a_owner_id" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.owner_id}"
}

output "subnet_management_tier_ap-southeast-1a_tags" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.tags}"
}

output "subnet_management_tier_ap-southeast-1a_vpc_id" {
	value = "${aws_subnet.management_tier_ap-southeast-1a.vpc_id}"
}

output "subnet_management_tier_ap-southeast-1b_arn" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.arn}"
}

output "subnet_management_tier_ap-southeast-1b_assign_ipv6_address_on_creation" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.assign_ipv6_address_on_creation}"
}

output "subnet_management_tier_ap-southeast-1b_availability_zone" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.availability_zone}"
}

output "subnet_management_tier_ap-southeast-1b_availability_zone_id" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.availability_zone_id}"
}

output "subnet_management_tier_ap-southeast-1b_cidr_block" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.cidr_block}"
}

output "subnet_management_tier_ap-southeast-1b_id" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.id}"
}

output "subnet_management_tier_ap-southeast-1b_ipv6_cidr_block" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.ipv6_cidr_block}"
}

output "subnet_management_tier_ap-southeast-1b_ipv6_cidr_block_association_id" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.ipv6_cidr_block_association_id}"
}

output "subnet_management_tier_ap-southeast-1b_map_public_ip_on_launch" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.map_public_ip_on_launch}"
}

output "subnet_management_tier_ap-southeast-1b_owner_id" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.owner_id}"
}

output "subnet_management_tier_ap-southeast-1b_tags" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.tags}"
}

output "subnet_management_tier_ap-southeast-1b_vpc_id" {
	value = "${aws_subnet.management_tier_ap-southeast-1b.vpc_id}"
}

output "subnet_management_tier_ids" {
    value = [
        "${aws_subnet.management_tier_ap-southeast-1a.id}",
        "${aws_subnet.management_tier_ap-southeast-1b.id}"
    ]
}

output "database_tier_cidr_block" {
	value = "${local.database_tier_cidr_block}"
}

output "subnet_database_tier_ap-southeast-1a_arn" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.arn}"
}

output "subnet_database_tier_ap-southeast-1a_assign_ipv6_address_on_creation" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.assign_ipv6_address_on_creation}"
}

output "subnet_database_tier_ap-southeast-1a_availability_zone" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.availability_zone}"
}

output "subnet_database_tier_ap-southeast-1a_availability_zone_id" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.availability_zone_id}"
}

output "subnet_database_tier_ap-southeast-1a_cidr_block" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.cidr_block}"
}

output "subnet_database_tier_ap-southeast-1a_id" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.id}"
}

output "subnet_database_tier_ap-southeast-1a_ipv6_cidr_block" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.ipv6_cidr_block}"
}

output "subnet_database_tier_ap-southeast-1a_ipv6_cidr_block_association_id" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.ipv6_cidr_block_association_id}"
}

output "subnet_database_tier_ap-southeast-1a_map_public_ip_on_launch" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.map_public_ip_on_launch}"
}

output "subnet_database_tier_ap-southeast-1a_owner_id" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.owner_id}"
}

output "subnet_database_tier_ap-southeast-1a_tags" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.tags}"
}

output "subnet_database_tier_ap-southeast-1a_vpc_id" {
	value = "${aws_subnet.database_tier_ap-southeast-1a.vpc_id}"
}

output "subnet_database_tier_ap-southeast-1b_arn" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.arn}"
}

output "subnet_database_tier_ap-southeast-1b_assign_ipv6_address_on_creation" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.assign_ipv6_address_on_creation}"
}

output "subnet_database_tier_ap-southeast-1b_availability_zone" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.availability_zone}"
}

output "subnet_database_tier_ap-southeast-1b_availability_zone_id" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.availability_zone_id}"
}

output "subnet_database_tier_ap-southeast-1b_cidr_block" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.cidr_block}"
}

output "subnet_database_tier_ap-southeast-1b_id" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.id}"
}

output "subnet_database_tier_ap-southeast-1b_ipv6_cidr_block" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.ipv6_cidr_block}"
}

output "subnet_database_tier_ap-southeast-1b_ipv6_cidr_block_association_id" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.ipv6_cidr_block_association_id}"
}

output "subnet_database_tier_ap-southeast-1b_map_public_ip_on_launch" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.map_public_ip_on_launch}"
}

output "subnet_database_tier_ap-southeast-1b_owner_id" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.owner_id}"
}

output "subnet_database_tier_ap-southeast-1b_tags" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.tags}"
}

output "subnet_database_tier_ap-southeast-1b_vpc_id" {
	value = "${aws_subnet.database_tier_ap-southeast-1b.vpc_id}"
}

output "subnet_database_tier_ids" {
    value = [
        "${aws_subnet.database_tier_ap-southeast-1a.id}",
        "${aws_subnet.database_tier_ap-southeast-1b.id}"
    ]
}
