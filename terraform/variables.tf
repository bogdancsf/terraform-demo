variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "secret_config" {
  type = string
  sensitive = true
}

variable "deploy_uai" {
  type = bool
  default = true
}