// https://docs.aws.amazon.com/eks/latest/userguide/eks-optimized-ami.html

// https://www.terraform.io/docs/providers/aws/d/aws_ami.html
data "aws_ami" "app" {
  filter {
    name = "name"
    values = [
      "stackx2019-figlet-app.*"]
  }
  most_recent = true
  owners = [
    "self"]
}

data "template_file" "user_data_app" {
  template = "${file("${path.module}/user_data_app.yml")}"
  vars {
    DB_ENDPOINT_URL = "postgres://${aws_db_instance.default.username}:${aws_db_instance.default.password}@${aws_db_instance.default.address}/${aws_db_instance.default.name}"
  }
}


// https://www.terraform.io/docs/providers/aws/r/launch_template.html
resource "aws_launch_template" "app" {
  name_prefix = "${var.owner_name}_app"
  image_id = "${data.aws_ami.app.id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "${aws_security_group.application_tier.id}"]

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
      Name = "${var.owner_name}_app"
    }
  }

  credit_specification = {
    cpu_credits = "unlimited"
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name = "${var.owner_name}_app.volume"
    }
  }

  tags = {
    Name = "${var.owner_name}.launch_template.app"
  }

  user_data = "${base64encode(data.template_file.user_data_app.rendered)}"
}

// https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html
resource "aws_autoscaling_group" "app" {
  vpc_zone_identifier = [
    "${aws_subnet.application_tier_ap-southeast-1a.id}",
    "${aws_subnet.application_tier_ap-southeast-1b.id}"]
  desired_capacity = "1"
  max_size = "1"
  min_size = "1"

  launch_template {
    id = "${aws_launch_template.app.id}"
    version = "$Latest"
  }
}
