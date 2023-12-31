variable "provider_config" {
  type = map(any)
  default = {
    subscription_id = "ID Da Subscription"
    tenant_id       = "ID Do Tenant"
  }
}

variable "app_name" {
  type = string
  default = "caique-oliveira-da-silva"
}

variable "location" {
  type    = string
  default = "East US 2"
}

variable "storage_account" {
  default = {
    config = {
      account_tier        = "Standard"
      account_replication = "LRS"
      account_kind        = "FileStorage"
    }
  }
}

variable "container_registry" {
  default = {
    config = {
      sku           = "Standard"
      admin_enabled = false
    }
  }
}

variable "app_service_config" {
  default = {
    config = {
      os_type  = "Linux"
      sku_name = "F1"
    }
  }
}
