provider "azurerm" {
  features {}
  storage_use_azuread = true
}

data "azurerm_client_config" "current_client_config" {}

##-----------------------------------------------------------------------------
## Resource Group module call
## Resource group in which all resources will be deployed.
##-----------------------------------------------------------------------------
module "resource_group" {
  source      = "terraform-az-modules/resource-group/azurerm"
  version     = "1.0.3"
  name        = "core"
  environment = "qa"
  location    = "centralus"
  label_order = ["name", "environment", "location"]
}

# ------------------------------------------------------------------------------
# Virtual Network
# ------------------------------------------------------------------------------
module "vnet" {
  source              = "terraform-az-modules/vnet/azurerm"
  version             = "1.0.3"
  name                = "core"
  environment         = "qa"
  label_order         = ["name", "environment", "location"]
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_spaces      = ["10.0.0.0/16"]
}

# ------------------------------------------------------------------------------
# Subnet
# ------------------------------------------------------------------------------
module "subnet" {
  source               = "terraform-az-modules/subnet/azurerm"
  version              = "1.0.1"
  environment          = "qa"
  label_order          = ["name", "environment", "location"]
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = module.vnet.vnet_name
  subnets = [
    {
      name            = "subnet1"
      subnet_prefixes = ["10.0.1.0/24"]
    }
  ]
}

# ------------------------------------------------------------------------------
# Log Analytics
# ------------------------------------------------------------------------------
module "log-analytics" {
  source                      = "terraform-az-modules/log-analytics/azurerm"
  version                     = "1.0.2"
  name                        = "core"
  environment                 = "qa"
  label_order                 = ["name", "environment", "location"]
  log_analytics_workspace_sku = "PerGB2018"
  resource_group_name         = module.resource_group.resource_group_name
  location                    = module.resource_group.resource_group_location
  log_analytics_workspace_id  = module.log-analytics.workspace_id
}

# ------------------------------------------------------------------------------
# Key Vault
# ------------------------------------------------------------------------------
module "vault" {
  source                        = "terraform-az-modules/key-vault/azurerm"
  version                       = "1.0.1"
  name                          = "core"
  environment                   = "qa"
  label_order                   = ["name", "environment", "location"]
  resource_group_name           = module.resource_group.resource_group_name
  location                      = module.resource_group.resource_group_location
  subnet_id                     = module.subnet.subnet_ids.subnet1
  public_network_access_enabled = false
  enable_private_endpoint       = false
  sku_name                      = "standard"
  network_acls = {
    bypass         = "AzureServices"
    default_action = "Deny"
    ip_rules       = []
  }
  reader_objects_ids = {
    "Key Vault Administrator" = {
      role_definition_name = "Key Vault Administrator"
      principal_id         = data.azurerm_client_config.current_client_config.object_id
    }
  }
  diagnostic_setting_enable = false
}

##----------------------------------------------------------------------------- 
## Storage module call.
##-----------------------------------------------------------------------------
module "storage" {
  source                        = "../.."
  name                          = "core"
  environment                   = "qa"
  label_order                   = ["name", "environment", "location"]
  resource_group_name           = module.resource_group.resource_group_name
  location                      = module.resource_group.resource_group_location
  public_network_access_enabled = false
  account_kind                  = "StorageV2"
  account_tier                  = "Standard"
  admin_objects_ids             = [data.azurerm_client_config.current_client_config.object_id]
  network_rules = [
    {
      default_action             = "Deny"
      ip_rules                   = []
      virtual_network_subnet_ids = []
      bypass                     = ["AzureServices"]
  }]

  ## customer_managed_key can only be set when the account_kind is set to StorageV2 or account_tier set to Premium, and the identity type is UserAssigned.
  cmk_encryption_enabled = true
  key_vault_id           = module.vault.id

  ##   Storage Container
  containers_list = [
    { name = "app-test", access_type = "private" },
  ]
  tables = ["table1"]
  queues = ["queue1"]
  file_shares = [
    { name = "fileshare", quota = "10" },
  ]

  ## Enable diagnostic settings
  enable_diagnostic          = true
  log_analytics_workspace_id = module.log-analytics.workspace_id
}
