# Database outputs
output "db_host" {
  value = "c-${yandex_mdb_postgresql_cluster.this.id}.rw.mdb.yandexcloud.net"
}

output "db_name" {
  value = yandex_mdb_postgresql_database.this.name
}

output "db_username" {
  value = yandex_mdb_postgresql_user.this.name
}

output "db_password" {
  value     = yandex_mdb_postgresql_user.this.password
  sensitive = true
}

# Registry
output "registry_id" {
  value = "cr.yandex/${yandex_container_registry.this.id}"
}

# Certificate outputs
output "certificate_id" {
  value = yandex_cm_certificate.this.id
}

output "dns_challenge" {
  value = "${yandex_cm_certificate.this.challenges[0].dns_type}:${yandex_cm_certificate.this.challenges[0].dns_value}"
}

# Kubernetes
output "kubernetes_cluster_id" {
  value = yandex_kubernetes_cluster.this.id
}

output "kubernetes_external_endpoint" {
  value = yandex_kubernetes_cluster.this.master[0].external_v4_endpoint
}

output "logging_group_id" {
  value = yandex_logging_group.this.id
}