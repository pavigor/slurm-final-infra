resource "yandex_kubernetes_cluster" "this" {
  name                    = var.kube_cluster_name
  description             = "Production cluster"
  network_id              = yandex_vpc_network.this.id
  node_service_account_id = yandex_iam_service_account.sa_k8s_image_puller.id
  service_account_id      = yandex_iam_service_account.sa_k8s_admin.id
  master {
    version = var.kube_master_version
    zonal {
      zone      = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.this["ru-central1-a"].id
    }
    public_ip = true

  }
  release_channel = "STABLE"
  depends_on = [
    yandex_container_registry_iam_binding.puller,
    yandex_resourcemanager_folder_iam_member.sa_k8s_admin_permission
  ]
}

resource "yandex_kubernetes_node_group" "this" {
  cluster_id = yandex_kubernetes_cluster.this.id
  name       = "node"
  version    = var.kube_node_version
  instance_template {
    platform_id = "standard-v2"

    resources {
      memory = var.node_resources.memory
      cores  = var.node_resources.cores
    }

    network_interface {
      nat        = true
      subnet_ids = [for s in yandex_vpc_subnet.this : "${s.id}"]
    }

    boot_disk {
      type = "network-hdd"
      size = 32
    }
  }
  allocation_policy {
    dynamic "location" {
      for_each = var.az
      content {
        zone = location.value
      }
    }
  }
  scale_policy {
    fixed_scale {
      size = 2
    }
  }
}