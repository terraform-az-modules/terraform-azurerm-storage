# AzureRM 5 upgrade

The basic, CMK, private endpoint and static website examples now require Terraform
1.10.0 or newer and AzureRM `~> 5.4` (5.4.0 through the 5.x series). The complete
example already allows AzureRM 5.4 through its existing `~> 5.3` constraint.
The reusable storage module's own version constraints are unchanged.

Two examples also need newer child modules for AzureRM 5 compatibility:

| Example | Module | Previous | Updated |
|---|---|---|---|
| cmk_enable | key-vault | 1.0.1 | 3.2.0 |
| private_endpoint | subnet | 1.0.1 | 1.0.3 |
| private_endpoint | private-dns | 1.0.2 | 1.0.8 |

These releases replace removed Key Vault contact configuration, subnet service
endpoint arguments, and Private DNS record/link arguments. The Key Vault update
crosses module major versions; inspect the plan for naming, access and replacement
changes when updating an existing deployment.

For an existing example deployment, preserve its state and lockfile, run
`terraform init -upgrade`, then review `terraform plan` using your usual Azure
login and subscription configuration before applying. Do not assume that a
provider/module upgrade is free of resource replacements.

All five examples were initialized and statically validated with Terraform
1.16.1 and AzureRM 5.4.0. These checks do not exercise Azure APIs or prove that an
existing deployment can be upgraded without changes. No live plan or apply was
performed as part of this update.

See the [AzureRM 5 migration guide](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/5.0-upgrade-guide)
and [Key Vault release history](https://github.com/terraform-az-modules/terraform-azurerm-key-vault/releases).
