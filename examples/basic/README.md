<!-- BEGIN_TF_DOCS -->

# ☁️ Basic Azure Storage Account

This example demonstrates a basic usage of the `terraform-azure-storage` module.

---

## ✅ Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | >= 1.6.6  |
| Azurerm   | >= 3.116.0|

---

## 🔌 Providers

_No providers are explicitly defined in this example._

---

## 📦 Modules

| Name           | Source                                     | Version |
|----------------|--------------------------------------------|---------|
| resource_group | terraform-az-modules/resource-group/azure | 1.0.0   |
| storage        | ../..                                     | n/a     |

---

## 🏗️ Resources

_No additional resources are created directly in this example._

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
