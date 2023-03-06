variable "kube_cluster_name" {
  type        = string
  description = "Kubernetes cluster name"
}

variable "kube_master_version" {
  type        = string
  description = "Version of Kubernetes that will be used for master"
}

variable "kube_node_version" {
  type        = string
  description = "Version of Kubernetes that will be used for Kubernetes node group"
}

variable "node_resources" {
  type = object({
    memory = number
    cores  = number
  })
  description = "Node resources"
}