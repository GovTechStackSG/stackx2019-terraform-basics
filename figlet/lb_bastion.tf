// https://www.terraform.io/docs/providers/aws/r/lb.html
resource "aws_lb" "bastion" {
  name = "${var.owner_name}-bastion"
  internal = false
  load_balancer_type = "network"
  subnets = [
    "${aws_subnet.management_tier_ap-southeast-1a.id}",
    "${aws_subnet.management_tier_ap-southeast-1b.id}"]


  tags = {
    Name = "${var.owner_name}-bastion"
  }
}


// https://www.terraform.io/docs/providers/aws/r/autoscaling_attachment.html
resource "aws_autoscaling_attachment" "bastion" {
  autoscaling_group_name = "${aws_autoscaling_group.bastion.id}"
  alb_target_group_arn = "${aws_lb_target_group.bastion.arn}"
}

// https://www.terraform.io/docs/providers/aws/r/lb_target_group.html
resource "aws_lb_target_group" "bastion" {
  name = "${var.owner_name}-bastion"
  port = 22
  protocol = "TCP"
  target_type = "instance"
  vpc_id = "${aws_vpc.main.id}"

  stickiness {
    enabled = false
    type = "lb_cookie"
  }
}

// https://www.terraform.io/docs/providers/aws/r/lb_listener.html
resource "aws_lb_listener" "bastion" {
  load_balancer_arn = "${aws_lb.bastion.arn}"
  port = "22"
  protocol = "TCP"

  default_action {
    type = "forward"
    target_group_arn = "${aws_lb_target_group.bastion.arn}"
  }
}


