resource "yandex_iam_service_account" "sa_k8s_image_puller" {
  name        = "k8s-image-puller"
  description = "Service account for pulling images from container registry"
}

resource "yandex_iam_service_account" "sa_k8s_admin" {
  name        = "k8s-cluster-manager"
  description = "Service account for managing cluster resources"
}

resource "yandex_iam_service_account" "sa_fluent_bit" {
  name        = "sa-fluent-bit"
  description = "Service account for FluentBit"
}

resource "yandex_resourcemanager_folder_iam_member" "sa_k8s_admin_permission" {
  folder_id = var.folder_id
  member    = "serviceAccount:${yandex_iam_service_account.sa_k8s_admin.id}"
  role      = "admin"
}

resource "yandex_resourcemanager_folder_iam_member" "sa_fluent_bit_logging_permission" {
  folder_id = var.folder_id
  member    = "serviceAccount:${yandex_iam_service_account.sa_fluent_bit.id}"
  role      = "logging.writer"
}

resource "yandex_resourcemanager_folder_iam_member" "sa_fluent_bit_monitoring_permission" {
  folder_id = var.folder_id
  member    = "serviceAccount:${yandex_iam_service_account.sa_fluent_bit.id}"
  role      = "monitoring.editor"
}