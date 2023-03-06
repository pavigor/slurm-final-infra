##### DATABASE VARIABLES #####
db_cluster_name = "yelb_db_cluster"
db_name         = "yelb_db"
db_user         = "yelb_admin"
db_password     = "yelb_password"

postgresql_version = "15"

host_resources = {
  resource_preset_id = "s2.micro"
  disk_type_id       = "network-ssd"
  disk_size          = 16
}

postgresql_config = {
  max_connections                = 395
  enable_parallel_hash           = true
  autovacuum_vacuum_scale_factor = 0.34
  default_transaction_isolation  = "TRANSACTION_ISOLATION_READ_COMMITTED"
  shared_preload_libraries       = "SHARED_PRELOAD_LIBRARIES_AUTO_EXPLAIN"
}

cluster_host_zones = ["ru-central1-a"]