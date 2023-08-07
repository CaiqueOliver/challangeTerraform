resource "azurerm_resource_group" "CAIQUE_OLIVEIRA_DA_SILVA" {
  name     = var.app_name
  location = var.location
}

resource "azurerm_service_plan" "CAIQUE_OLIVEIRA_DA_SILVA" {
  for_each            = var.app_service_config
  name                = var.app_name
  location            = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.location
  resource_group_name = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.name
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}

resource "azurerm_linux_web_app" "CAIQUE_OLIVEIRA_DA_SILVA" {
  for_each            = var.app_service_config
  name                = var.app_name
  service_plan_id     = azurerm_service_plan.CAIQUE_OLIVEIRA_DA_SILVA[each.key]
  location            = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.location
  resource_group_name = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.name
  site_config {}
}

resource "azurerm_storage_account" "CAIQUE_OLIVEIRA_DA_SILVA" {
  for_each                 = var.storage_account
  name                     = var.app_name
  location                 = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.location
  resource_group_name      = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.name
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication
  account_kind             = each.value.account_kind
}

resource "azurerm_container_registry" "CAIQUE_OLIVEIRA_DA_SILVA" {
  for_each            = var.container_registry
  name                = var.app_name
  location            = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.location
  resource_group_name = azurerm_resource_group.CAIQUE_OLIVEIRA_DA_SILVA.name
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled
}