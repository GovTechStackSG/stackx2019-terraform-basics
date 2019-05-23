
// https://www.terraform.io/docs/providers/aws/r/acm_certificate.html
resource "aws_acm_certificate" "cert" {
  domain_name = "${aws_route53_record.web.name}"
  validation_method = "DNS"

  tags = {
    Name = "${var.owner_name}_web"
  }

  lifecycle {
    create_before_destroy = true
  }
}


// https://www.terraform.io/docs/providers/aws/r/route53_record.html
resource "aws_route53_record" "cert_validation" {
  name    = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_type}"
  zone_id = "${aws_route53_zone.public.id}"
  records = ["${aws_acm_certificate.cert.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}


// https://www.terraform.io/docs/providers/aws/r/acm_certificate_validation.html
resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = "${aws_acm_certificate.cert.arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
}

