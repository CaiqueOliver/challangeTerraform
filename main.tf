resource "azurerm_resource_group" "CAIQUE_OLIVEIRA_DA_SILVA" {
  name     = var.app_name
  location = var.location
}

resource "azurerm_service_plan" "CAIQUE_OLIVEIRA_DA_SILVA" {
  name                = var.app_name
  location            = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.location
  resource_group_name = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.name
  os_type             = var.app_service_config["os_type"]
  sku_name            = var.app_service_config["sku_name"]
}

resource "azurerm_linux_web_app" "CAIQUE_OLIVEIRA_DA_SILVA" {
  name                = var.app_name
  service_plan_id     = azurerm_service_plan.CAIQUE_OLIVEIRA_DA_SILVA.id
  location            = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.location
  resource_group_name = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.name
  site_config {}
}

resource "azurerm_storage_account" "CAIQUE_OLIVEIRA_DA_SILVA" {
  name                     = var.app_name
  location                 = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.location
  resource_group_name      = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.name
  account_tier             = var.storage_account["account_tier"]
  account_replication_type = var.storage_account["account_replication"]
  account_kind             = var.storage_account["account_kind"]
}

resource "azurerm_container_registry" "CAIQUE_OLIVEIRA_DA_SILVA" {
  name                = var.app_name
  location            = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.location
  resource_group_name = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.name
  sku                 = var.container_registry["sku"]
  admin_enabled       = var.container_registry["admin_enabled"]
}