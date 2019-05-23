data "aws_route53_zone" "parent" {
  name = "gdshive.com."
}

resource "aws_route53_zone" "public" {
  name = "stackx2019.${data.aws_route53_zone.parent.name}"
}


resource "aws_route53_record" "subdomain" {
  zone_id = "${data.aws_route53_zone.parent.zone_id}"
  name = "${aws_route53_zone.public.name}"
  type = "NS"
  ttl = "30"

  records = [
    "${aws_route53_zone.public.name_servers.0}",
    "${aws_route53_zone.public.name_servers.1}",
    "${aws_route53_zone.public.name_servers.2}",
    "${aws_route53_zone.public.name_servers.3}",
  ]
}

resource "aws_route53_zone" "private" {
  name = "${aws_route53_zone.public.name}"
  vpc {
    vpc_id = "${aws_vpc.main.id}"
  }
}


resource "aws_route53_record" "web" {
  zone_id = "${aws_route53_zone.public.zone_id}"
  name = "${var.owner_name}-web.${aws_route53_zone.public.name}"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "${aws_lb.web.dns_name}"
    zone_id = "${aws_lb.web.zone_id}"
  }
}


resource "aws_route53_record" "app" {
  zone_id = "${aws_route53_zone.private.zone_id}"
  name = "${var.owner_name}-app.${aws_route53_zone.public.name}"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "${aws_lb.app.dns_name}"
    zone_id = "${aws_lb.app.zone_id}"
  }
}



resource "aws_route53_record" "bastion" {
  zone_id = "${aws_route53_zone.public.zone_id}"
  name = "${var.owner_name}-bastion.${aws_route53_zone.public.name}"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "${aws_lb.bastion.dns_name}"
    zone_id = "${aws_lb.bastion.zone_id}"
  }
}


