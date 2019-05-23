// https://www.terraform.io/docs/providers/aws/r/lb.html
resource "aws_lb" "web" {
  name = "${var.owner_name}-web"
  internal = false
  load_balancer_type = "application"
  security_groups = [
    "${aws_security_group.web_tier.id}"]
  subnets = [
    "${aws_subnet.web_tier_ap-southeast-1a.id}",
    "${aws_subnet.web_tier_ap-southeast-1b.id}"]


  tags = {
    Name = "${var.owner_name}-web"
  }
}


// https://www.terraform.io/docs/providers/aws/r/autoscaling_attachment.html
resource "aws_autoscaling_attachment" "web" {
  autoscaling_group_name = "${aws_autoscaling_group.web.id}"
  alb_target_group_arn = "${aws_lb_target_group.web.arn}"
}

// https://www.terraform.io/docs/providers/aws/r/lb_target_group.html
resource "aws_lb_target_group" "web" {
  name = "${var.owner_name}-web"
  port = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = "${aws_vpc.main.id}"
}

// https://www.terraform.io/docs/providers/aws/r/lb_listener.html
resource "aws_lb_listener" "web" {
  load_balancer_arn = "${aws_lb.web.arn}"
  port = "443"
  protocol = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  certificate_arn = "${aws_acm_certificate_validation.cert.certificate_arn}"

  default_action {
    type = "forward"
    target_group_arn = "${aws_lb_target_group.web.arn}"
  }
}




