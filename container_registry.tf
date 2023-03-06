resource "yandex_container_registry" "this" {
  name = "yelb-registry"

  labels = {
    env = var.environment
  }
}

resource "yandex_container_registry_iam_binding" "puller" {
  registry_id = yandex_container_registry.this.id
  role        = "container-registry.images.puller"

  members = [
    "serviceAccount:${yandex_iam_service_account.sa_k8s_image_puller.id}",
  ]
}

resource "yandex_container_registry_iam_binding" "pusher" {
  registry_id = yandex_container_registry.this.id
  role        = "container-registry.images.pusher"

  members = [
    "serviceAccount:${yandex_iam_service_account.sa_k8s_image_puller.id}",
  ]
}