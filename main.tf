provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azuread_application" "example" {
  name = "OAuth2 Proxy"
  reply_urls = ["http://localhost:4180/oauth2/callback"]
}

resource "azuread_service_principal" "example" {
  application_id = azuread_application.example.application_id
}

resource "azuread_service_principal_password" "example" {
  service_principal_id = azuread_service_principal.example.id
  value                = "<password>"
  end_date             = "2099-01-01T01:02:03Z"
}

output "application_id" {
  description = "The Application ID."
  value       = azuread_application.example.application_id
}

output "service_principal_password" {
  description = "The Service Principal password."
  value       = azuread_service_principal_password.example.value
}
