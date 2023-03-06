##### DATABASE VARIABLES #####

variable "db_cluster_name" {
  type        = string
  description = "PostrgeSQL cluster name"
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "db_user" {
  type        = string
  description = "Database user"
}

variable "db_password" {
  type        = string
  description = "Database password"
}

variable "postgresql_version" {
  type        = string
  description = "Version of the PostgreSQL cluster"
  default     = "15"
}

##### HA CONFIGURATION #####
variable "cluster_host_zones" {
  type        = list(string)
  description = "Define how many hosts in cluster should be created. More than one zone will automatically enable cluster HA"
}

##### HOST RESOURCES #####
variable "host_resources" {
  type = object({
    disk_size          = number
    disk_type_id       = string
    resource_preset_id = string
  })
}

variable "assign_public_ip" {
  type        = bool
  default     = false
  description = "Assign public IP to PostgreSQL host"
}

##### PSQL CONFIG #####
variable "postgresql_config" {
  type = object({
    max_connections                = number
    enable_parallel_hash           = bool
    autovacuum_vacuum_scale_factor = number
    default_transaction_isolation  = string
    shared_preload_libraries       = string
  })
}