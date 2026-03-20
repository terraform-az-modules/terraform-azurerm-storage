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
  environment = "dev"
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
  environment         = "dev"
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
  environment          = "dev"
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
# Private DNS Zone module call
# ------------------------------------------------------------------------------
module "private_dns_zone" {
  source              = "terraform-az-modules/private-dns/azurerm"
  version             = "1.0.2"
  resource_group_name = module.resource_group.resource_group_name
  name                = "core"
  environment         = "dev"
  location            = module.resource_group.resource_group_location
  label_order         = ["name", "environment", "location"]

  private_dns_config = [
    {
      resource_type = "storage_account"
      vnet_ids      = [module.vnet.vnet_id]
    }
  ]
}

##-----------------------------------------------------------------------------
## Storage module call.
## Here storage account will be deployed with private dns zone.
##-----------------------------------------------------------------------------
module "storage" {
  source                        = "../.."
  storage_account_name          = "app1storagepvtep"
  resource_group_name           = module.resource_group.resource_group_name
  location                      = module.resource_group.resource_group_location
  public_network_access_enabled = false
  account_kind                  = "StorageV2"
  account_tier                  = "Standard"
  admin_objects_ids             = [data.azurerm_client_config.current_client_config.object_id]
  enable_private_endpoint       = true
  private_dns_zone_ids          = module.private_dns_zone.private_dns_zone_ids.storage_account
  subnet_id                     = module.subnet.subnet_ids["subnet1"]
  network_rules = [
    {
      default_action             = "Deny"
      ip_rules                   = []
      virtual_network_subnet_ids = []
      bypass                     = ["AzureServices"]
  }]
}
