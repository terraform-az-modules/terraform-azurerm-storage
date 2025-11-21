<!-- BEGIN_TF_DOCS -->

# ☁️ Azure Storage Account with Azure AD Authentication

This example demonstrates how to deploy an Azure Storage Account using the `terraform-azure-storage` module, integrated with **Azure AD Authentication**.

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

| Name           | Source                                     | Version |
|----------------|--------------------------------------------|---------|
| resource_group | terraform-az-modules/resource-group/azure | 1.0.0   |
| storage        | ../..                                     | n/a     |

---

## 🏗️ Resources

| Name                                                        | Type        |
|-------------------------------------------------------------|-------------|
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
