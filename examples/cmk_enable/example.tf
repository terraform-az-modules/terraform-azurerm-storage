provider "azurerm" {
  features {}
  storage_use_azuread = true
}

data "azurerm_client_config" "current_client_config" {}

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

# ------------------------------------------------------------------------------
# Key Vault
# ------------------------------------------------------------------------------
module "vault" {
  source                        = "terraform-az-modules/key-vault/azurerm"
  version                       = "1.0.1"
  name                          = "core"
  environment                   = "prod"
  label_order                   = ["name", "environment", "location"]
  resource_group_name           = module.resource_group.resource_group_name
  location                      = module.resource_group.resource_group_location
  public_network_access_enabled = true
  sku_name                      = "standard"
  reader_objects_ids = {
    "Key Vault Administrator" = {
      role_definition_name = "Key Vault Administrator"
      principal_id         = data.azurerm_client_config.current_client_config.object_id
    }
  }
  enable_private_endpoint = false
}

##-----------------------------------------------------------------------------
## Storage module call.
## Here storage account will be deployed with CMK encryption.
##-----------------------------------------------------------------------------
module "storage" {
  source                        = "../.."
  storage_account_name          = "app1storagecmk"
  resource_group_name           = module.resource_group.resource_group_name
  location                      = module.resource_group.resource_group_location
  public_network_access_enabled = true
  account_kind                  = "StorageV2"
  account_tier                  = "Standard"
  admin_objects_ids             = [data.azurerm_client_config.current_client_config.object_id]
  network_rules = [
    {
      default_action             = "Deny"
      bypass                     = ["AzureServices"]
      ip_rules                   = []
      virtual_network_subnet_ids = []
  }]

  ###customer_managed_key can only be set when the account_kind is set to StorageV2 or account_tier set to Premium, and the identity type is UserAssigned.
  cmk_encryption_enabled            = true
  key_vault_id                      = module.vault.id
  enable_queue_properties           = false
  enable_advanced_threat_protection = false
}
