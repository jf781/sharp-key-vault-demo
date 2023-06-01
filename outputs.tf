output "resource_group_name" {
  description = "The name of the created resource group"
  value       = azurerm_resource_group.example.name
}

output "key_vault_id" {
  description = "The ID of the created key vault"
  value       = azurerm_key_vault.example.id
}

output "secret_id" {
  description = "The ID of the created secret within the key vault"
  value       = azurerm_key_vault_secret.example.id
}
