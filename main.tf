resource "azurerm_resource_group" "CAIQUE_OLIVEIRA_DA_SILVA" {
  name     = var.app_name
  location = var.location
}

resource "azurerm_service_plan" "CAIQUE_OLIVEIRA_DA_SILVA" {
  name                = var.app_name
  location            = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.location
  resource_group_name = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.name
  os_type             = "Linux"
  sku_name            = "F1"
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
  resource_group_name      = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.name
  location                 = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "FileStorage"
}

resource "azurerm_container_registry" "CAIQUE_OLIVEIRA_DA_SILVA" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.name
  location            = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.location
  sku                 = "Standard"
  admin_enabled       = false
}