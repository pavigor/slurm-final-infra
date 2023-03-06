resource "yandex_logging_group" "this" {
  name             = "yelb-cluster"
  folder_id        = var.folder_id
  retention_period = "2h"
}