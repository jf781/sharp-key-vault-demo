variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "tags" {
  description = "The tags to be applied to the resources"
  type        = map(string)
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the key vault"
  type        = string
}

variable "secret_name" {
  description = "The name of the secret to be stored in the key vault"
  type        = string
}

variable "secret_value" {
  description = "The value of the secret to be stored in the key vault"
  type        = string
  sensitive   = true
}