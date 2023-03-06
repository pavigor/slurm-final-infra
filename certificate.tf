resource "yandex_cm_certificate" "this" {
  name    = var.cm_certificate
  domains = [var.certificate_domain_name]
  managed {
    challenge_type = "DNS_CNAME"
  }
}