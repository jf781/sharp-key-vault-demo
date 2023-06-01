variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the key vault"
  type        = string
}

variable "azure_tenant_id" {
  description = "The tenant id for the Azure subscription"
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