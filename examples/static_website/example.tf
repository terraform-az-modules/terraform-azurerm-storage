provider "azurerm" {
  features {}
  storage_use_azuread = true
}

##-----------------------------------------------------------------------------
## Resource Group
##-----------------------------------------------------------------------------
module "resource_group" {
  source      = "terraform-az-modules/resource-group/azurerm"
  version     = "1.0.3"
  name        = "static-website"
  environment = "prod"
  location    = "eastus"
}

##-----------------------------------------------------------------------------
## Storage Account with Static Website Configuration
##-----------------------------------------------------------------------------
module "storage" {
  source                   = "../.."
  storage_account_name     = "staticwebsitestorage"
  resource_group_name      = module.resource_group.resource_group_name
  location                 = module.resource_group.resource_group_location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  #static website configuration
  enable_static_website = true
  error_404_document    = "404.html"
  index_document        = "index.html"

  # Public access required for static websites
  public_network_access_enabled   = true
  allow_nested_items_to_be_public = true

  # Disable features not needed for static hosting
  shared_access_key_enabled = false

}
