terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
    }
  }
}

provider "azurerm" {
  tenant_id       = var.provider_config["tenant_id"]
  subscription_id = var.provider_config["subscription_id"]
  features {}
}
