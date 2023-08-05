variable "provider_config" {
  type = map(any)
  default = {
    subscription_id = "ID Da Subscription"
    tenant_id       = "ID Do Tenant"
  }
}

variable "location" {
  type    = string
  default = "East US 2"
}

variable "app_name" {
  type    = string
  default = "caique-oliveira-da-silva"
}