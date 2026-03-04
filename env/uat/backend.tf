terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstatestore123"
    container_name       = "tfstate"
    key                  = "uat.tfstate"
  }
}