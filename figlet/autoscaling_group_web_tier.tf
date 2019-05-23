// https://docs.aws.amazon.com/eks/latest/userguide/eks-optimized-ami.html

// https://www.terraform.io/docs/providers/aws/d/aws_ami.html
data "aws_ami" "web" {
  filter {
    name = "name"
    values = [
      "stackx2019-figlet-web.*"]
  }
  most_recent = true
  owners = [
    "self"]
}

data "template_file" "user_data_web" {
  template = "${file("${path.module}/user_data_web.yml")}"
  vars {
    UPSTREAM_HOST = "${aws_lb.app.dns_name}"
    UPSTREAM_PORT = "${aws_lb_listener.app.port}"
    DNS_RESOLVER = "${cidrhost(aws_vpc.main.cidr_block, 2)}"
  }
}


// https://www.terraform.io/docs/providers/aws/r/launch_template.html
resource "aws_launch_template" "web" {
  name_prefix = "${var.owner_name}_web"
  image_id = "${data.aws_ami.web.id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "${aws_security_group.web_tier.id}"]

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = "20"
      delete_on_termination = true
    }
  }

  key_name = "${aws_key_pair.stackx2019-training.key_name}"

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.owner_name}_web"
    }
  }

  credit_specification = {
    cpu_credits = "unlimited"
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name = "${var.owner_name}_web.volume"
    }
  }

  tags = {
    Name = "${var.owner_name}.launch_template.web"
  }

  user_data = "${base64encode(data.template_file.user_data_web.rendered)}"
}

// https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html
resource "aws_autoscaling_group" "web" {
  vpc_zone_identifier = [
    "${aws_subnet.web_tier_ap-southeast-1a.id}",
    "${aws_subnet.web_tier_ap-southeast-1b.id}"]
  desired_capacity = "1"
  max_size = "1"
  min_size = "1"

  launch_template {
    id = "${aws_launch_template.web.id}"
    version = "$Latest"
  }
}
