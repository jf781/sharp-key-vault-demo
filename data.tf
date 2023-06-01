data "azurerm_client_config" "current" {}

data "azurerm_role_definition" "kv_admin" {
  name = "Key Vault Secrets Officer"
}



data "azuread_user" "joe" {
  user_principal_name = "joe.fecht@copilotms.com"
}