resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_password" "example" {
  length  = 16
  special = true
}

resource "azurerm_key_vault" "example" {
  name                        = var.key_vault_name
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = true
}

resource "azurerm_key_vault_secret" "example" {
  name         = var.secret_name
  value        = random_password.example.result
  key_vault_id = azurerm_key_vault.example.id
  depends_on = [
    azurerm_key_vault.example
  ]
}
