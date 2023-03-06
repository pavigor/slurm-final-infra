variable "az" {
  type        = list(string)
  description = "A list of availability zones"
  default     = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
}

variable "labels" {
  type        = map(any)
  description = "Labels applied to resources"
}

variable "cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks for network"
}

# Instance group settings
variable "environment" {
  type        = string
  description = "Type of environment (qa, prod, dev)"
  default     = "dev"
}

variable "folder_id" {
  type = string
}

# Certificate manager settings
variable "cm_certificate" {
  type        = string
  description = "Certificate name"
}

variable "certificate_domain_name" {
  type        = string
  description = "Domain for this certificate"
}