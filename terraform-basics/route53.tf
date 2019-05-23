data "aws_route53_zone" "public" {
  zone_id = "${var.route53_public_zone_id}"
}

resource "aws_route53_record" "web" {
  zone_id = "${data.aws_route53_zone.public.zone_id}"
  name = "${var.username}-web.${data.aws_route53_zone.public.name}"
  type = "A"
  records = ["${aws_instance.web.public_ip}"]
}
