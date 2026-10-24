terraform {
  backend "azurerm" {
    resource_group_name  = "backend-rg01"
    storage_account_name = "backendstg01"
    container_name       = "backend-container01"
    key                  = "dev.tfstate"
    # use_azuread_auth = false
  }
}