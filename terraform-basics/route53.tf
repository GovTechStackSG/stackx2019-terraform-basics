data "aws_route53_zone" "public" {
  name = "stackx.govtechstack.sg."
}

resource "aws_route53_record" "web" {
  zone_id = "${data.aws_route53_zone.public.zone_id}"
  name = "${var.username}-web.${data.aws_route53_zone.public.name}"
  type = "A"
  records = ["${aws_instance.web.public_ip}"]
  ttl = "300"
}
