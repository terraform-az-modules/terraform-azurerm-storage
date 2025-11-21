<!-- BEGIN_TF_DOCS -->

# 📦 Example: Full Azure Storage Deployment with Networking, Key Vault & Monitoring

This example showcases a complete deployment of an Azure Storage Account using the `terraform-azure-storage` module. It also provisions supporting infrastructure components such as:

- Virtual Network and Subnet
- Azure Key Vault
- Log Analytics Workspace
- Resource Group


---

## ✅ Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | >= 1.6.6  |
| Azurerm   | >= 3.116.0|

---

## 🔌 Providers

| Name    | Version |
|---------|---------|
| azurerm | 4.33.0  |

---

## 📦 Modules

| Name            | Source                                                   | Version |
|-----------------|----------------------------------------------------------|---------|
| log-analytics   | clouddrove/log-analytics/azure                          | 2.0.0   |
| resource_group  | terraform-az-modules/resource-group/azure              | 1.0.0   |
| storage         | ../..                                                   | n/a     |
| subnet          | terraform-az-modules/subnet/azure                       | 1.0.0   |
| vault           | github.com/clouddrove/terraform-azure-key-vault.git     | master  |
| vnet            | terraform-az-modules/vnet/azure                         | 1.0.0   |

---

## 🏗️ Resources

| Name                                                                                         | Type        |
|----------------------------------------------------------------------------------------------|-------------|
| [azurerm_client_config.current_client_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | Data Source |

---

## 🔧 Inputs

_No input variables are required for this example._

---

## 📤 Outputs

| Name                   | Description                       |
|------------------------|-----------------------------------|
| `file_shares`          | Storage SMB file shares list      |
| `queues`               | Storage queues list               |
| `storage_account_id`   | The ID of the storage account     |
| `storage_account_name` | The name of the storage account   |
| `tables`               | Storage tables list               |

<!-- END_TF_DOCS -->
