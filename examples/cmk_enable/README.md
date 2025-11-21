<!-- BEGIN_TF_DOCS -->

# 🔐 Azure Storage Account with Key Vault Integration

This example demonstrates how to deploy an Azure Storage Account using the `terraform-azure-storage` module, a Key Vault using the module, and a Resource Group. It also retrieves the current client configuration using the AzureRM provider.

---

## ✅ Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | >= 1.6.6  |
| Azurerm   | >= 3.116.0|

---

## 🔌 Providers

| Name    | Version   |
|---------|-----------|
| azurerm | >= 3.116.0|

---

## 📦 Modules

| Name           | Source                                                   | Version |
|----------------|----------------------------------------------------------|---------|
| resource_group | terraform-az-modules/resource-group/azure               | 1.0.0   |
| storage        | ../..                                                   | n/a     |
| vault          | github.com/clouddrove/terraform-azure-key-vault.git     | master  |

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

| Name                   | Description                     |
|------------------------|---------------------------------|
| `storage_account_id`   | The ID of the storage account   |
| `storage_account_name` | The name of the storage account |

<!-- END_TF_DOCS -->
