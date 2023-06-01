resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_password" "pwd" {
  length  = 16
  special = true
}

resource "azurerm_key_vault" "kv" {
  name                     = var.key_vault_name
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = "standard"
  purge_protection_enabled = true
}

resource "azurerm_role_assignment" "tfc_app_reg" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = data.azurerm_role_definition.kv_admin.name
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "kv_current_user" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = data.azurerm_role_definition.kv_admin.name
  principal_id         = data.azuread_user.joe.object_id
}


resource "azurerm_key_vault_secret" "secret" {
  name         = var.secret_name
  value        = random_password.pwd.result
  key_vault_id = azurerm_key_vault.kv.id
  depends_on = [
    azurerm_role_assignment.tfc_app_reg
  ]
}
