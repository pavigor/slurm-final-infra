resource "yandex_mdb_postgresql_cluster" "this" {
  name        = var.db_cluster_name
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.this.id

  labels = {
    env = var.environment
  }

  config {
    version = var.postgresql_version
    resources {
      resource_preset_id = var.host_resources.resource_preset_id
      disk_type_id       = var.host_resources.disk_type_id
      disk_size          = var.host_resources.disk_size
    }
    postgresql_config = {
      max_connections                = var.postgresql_config.max_connections
      enable_parallel_hash           = var.postgresql_config.enable_parallel_hash
      autovacuum_vacuum_scale_factor = var.postgresql_config.autovacuum_vacuum_scale_factor
      default_transaction_isolation  = var.postgresql_config.default_transaction_isolation
      shared_preload_libraries       = var.postgresql_config.shared_preload_libraries
    }
  }

  maintenance_window {
    type = "WEEKLY"
    day  = "SAT"
    hour = 12
  }

  dynamic "host" {
    for_each = var.cluster_host_zones
    content {
      zone             = host.value
      subnet_id        = yandex_vpc_subnet.this[host.value].id
      assign_public_ip = true
    }
  }
}

resource "yandex_mdb_postgresql_user" "this" {
  cluster_id = yandex_mdb_postgresql_cluster.this.id
  name       = var.db_user
  password   = var.db_password
}

resource "yandex_mdb_postgresql_database" "this" {
  cluster_id = yandex_mdb_postgresql_cluster.this.id
  name       = var.db_name
  owner      = yandex_mdb_postgresql_user.this.name
  lc_collate = "en_US.UTF-8"
  lc_type    = "en_US.UTF-8"
  extension {
    name = "uuid-ossp"
  }
  extension {
    name = "xml2"
  }
}