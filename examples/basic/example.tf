provider "azurerm" {
  features {}
  storage_use_azuread = true
}

##----------------------------------------------------------------------------- 
## Resource Group module call
##-----------------------------------------------------------------------------
module "resource_group" {
  source      = "terraform-az-modules/resource-group/azurerm"
  version     = "1.0.3"
  name        = "app1"
  environment = "test"
  location    = "northeurope"
}

##----------------------------------------------------------------------------- 
## Storage module call. 
##-----------------------------------------------------------------------------
module "storage" {
  source                   = "../.."
  name                     = "app1"
  environment              = "test"
  label_order              = ["name", "environment", "location"]
  resource_group_name      = module.resource_group.resource_group_name
  location                 = module.resource_group.resource_group_location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
