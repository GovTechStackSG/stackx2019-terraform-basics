// https://www.terraform.io/docs/providers/aws/r/lb.html
resource "aws_lb" "app" {
  name = "${var.owner_name}-app"
  internal = true
  load_balancer_type = "application"
  security_groups = [
    "${aws_security_group.application_tier.id}"]
  subnets = [
    "${aws_subnet.application_tier_ap-southeast-1a.id}",
    "${aws_subnet.application_tier_ap-southeast-1b.id}"]


  tags = {
    Name = "${var.owner_name}-app"
  }
}


// https://www.terraform.io/docs/providers/aws/r/autoscaling_attachment.html
resource "aws_autoscaling_attachment" "app" {
  autoscaling_group_name = "${aws_autoscaling_group.app.id}"
  alb_target_group_arn = "${aws_lb_target_group.app.arn}"
}

// https://www.terraform.io/docs/providers/aws/r/lb_target_group.html
resource "aws_lb_target_group" "app" {
  name = "${var.owner_name}-app"
  port = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = "${aws_vpc.main.id}"
}

// https://www.terraform.io/docs/providers/aws/r/lb_listener.html
resource "aws_lb_listener" "app" {
  load_balancer_arn = "${aws_lb.app.arn}"
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = "${aws_lb_target_group.app.arn}"
  }
}


