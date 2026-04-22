## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_tier | Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool. | `string` | `"Hot"` | no |
| account\_kind | The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. | `string` | `"StorageV2"` | no |
| account\_replication\_type | Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. | `string` | `"LRS"` | no |
| account\_tier | Defines the Tier to use for this storage account. | `string` | `"Standard"` | no |
| admin\_objects\_ids | IDs of the objects that can do all operations on all keys, secrets and certificates. | `list(string)` | `[]` | no |
| allow\_nested\_items\_to\_be\_public | Allow or disallow nested items within this Account to opt into being public. Defaults to true. | `bool` | `false` | no |
| allowed\_copy\_scope | Restrict copy to and from Storage Accounts within an AAD tenant or with Private Links to the same VNet. Possible values are AAD and PrivateLink. | `string` | `"PrivateLink"` | no |
| blob\_logs | Log categories for Blob service diagnostics. | `list(string)` | <pre>[<br>  "StorageRead",<br>  "StorageWrite",<br>  "StorageDelete"<br>]</pre> | no |
| blob\_metrics | Metric categories for Blob service diagnostics. | `list(string)` | <pre>[<br>  "Transaction",<br>  "Capacity"<br>]</pre> | no |
| cmk\_encryption\_enabled | Whether to create CMK or not | `bool` | `false` | no |
| containers\_list | List of containers to create and their access levels. | `list(object({ name = string, access_type = string }))` | `[]` | no |
| cross\_tenant\_replication\_enabled | Should cross Tenant replication be enabled? Defaults to true. | `bool` | `true` | no |
| custom\_domain\_name | The Custom Domain Name to use for the Storage Account, which will be validated by Azure. | `string` | `null` | no |
| custom\_name | Define your custom name to override default naming convention | `string` | `null` | no |
| datastorages | n/a | `list(string)` | <pre>[<br>  "blob",<br>  "queue",<br>  "table",<br>  "file"<br>]</pre> | no |
| default\_to\_oauth\_authentication | Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account. The default value is false | `bool` | `false` | no |
| deployment\_mode | Specifies how the infrastructure/resource is deployed | `string` | `"terraform"` | no |
| edge\_zone | Specifies the Edge Zone within the Azure Region where this Storage Account should exist. | `string` | `null` | no |
| enable\_advanced\_threat\_protection | Boolean flag which controls if advanced threat protection is enabled. | `bool` | `false` | no |
| enable\_blob\_diagnostics | Enable diagnostic settings for Blob service. | `bool` | `false` | no |
| enable\_diagnostic | Set to false to prevent the module from creating the diagnosys setting for the NSG Resource.. | `bool` | `false` | no |
| enable\_file\_diagnostics | Enable diagnostic settings for File service. | `bool` | `false` | no |
| enable\_file\_share\_cors\_rules | Whether or not enable file share cors rules. | `bool` | `false` | no |
| enable\_hour\_metrics | Enable or disable the creation of the hour\_metrics block. | `bool` | `false` | no |
| enable\_https\_traffic\_only | Boolean flag which forces HTTPS if enabled, see here for more information. | `bool` | `true` | no |
| enable\_minute\_metrics | Enable or disable the creation of the minute\_metrics block. | `bool` | `false` | no |
| enable\_network\_rules | Enable or disable the creation of the network\_rules block. | `bool` | `false` | no |
| enable\_private\_endpoint | enable or disable private endpoint to storage account | `bool` | `false` | no |
| enable\_private\_link\_access | Enable or disable the creation of the private\_link\_access. | `bool` | `false` | no |
| enable\_queue | Enable or disable the creation of the queues | `bool` | `true` | no |
| enable\_queue\_diagnostics | Enable diagnostic settings for Queue service. | `bool` | `false` | no |
| enable\_queue\_properties | Enable or disable the creation of the queue properties | `bool` | `false` | no |
| enable\_routing | Enable or disable the creation of the routing block. | `bool` | `false` | no |
| enable\_sas\_policy | Enable or disable the creation of the sas\_policy block. | `bool` | `false` | no |
| enable\_static\_website | Enable or disable the creation of the static website configuration | `bool` | `false` | no |
| enable\_table\_diagnostics | Enable diagnostic settings for Table service. | `bool` | `false` | no |
| enabled | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| error\_404\_document | The name of the error document for the static website. | `string` | `"404.html"` | no |
| eventhub\_authorization\_rule\_id | Eventhub authorization rule id to pass it to destination details of diagnosys setting of NSG. | `string` | `null` | no |
| eventhub\_name | Eventhub Name to pass it to destination details of diagnosys setting of NSG. | `string` | `null` | no |
| expiration\_date | Expiration UTC datetime (Y-m-d'T'H:M:S'Z') | `string` | `"2034-10-22T18:29:59Z"` | no |
| extra\_tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(string)` | `null` | no |
| file\_logs | Log categories for File service diagnostics. | `list(string)` | <pre>[<br>  "StorageRead",<br>  "StorageWrite",<br>  "StorageDelete"<br>]</pre> | no |
| file\_metrics | Metric categories for File service diagnostics. | `list(string)` | <pre>[<br>  "Transaction",<br>  "Capacity"<br>]</pre> | no |
| file\_share\_authentication | Storage Account file shares authentication configuration. | <pre>object({<br>    directory_type                 = string<br>    default_share_level_permission = optional(string, "None")<br>    active_directory = optional(object({<br>      storage_sid         = string<br>      domain_name         = string<br>      domain_sid          = optional(string)<br>      domain_guid         = optional(string)<br>      forest_name         = optional(string)<br>      netbios_domain_name = optional(string)<br>    }))<br>  })</pre> | `null` | no |
| file\_share\_cors\_rules | Storage Account file shares CORS rule. | <pre>list(object({<br>    allowed_headers    = list(string)<br>    allowed_methods    = list(string)<br>    allowed_origins    = list(string)<br>    exposed_headers    = list(string)<br>    max_age_in_seconds = number<br>  }))</pre> | `null` | no |
| file\_share\_properties\_smb | Storage Account file shares smb properties. | <pre>object({<br>    versions                        = optional(list(string))<br>    authentication_types            = optional(list(string))<br>    kerberos_ticket_encryption_type = optional(list(string))<br>    channel_encryption_type         = optional(list(string))<br>    multichannel_enabled            = optional(bool)<br>  })</pre> | `null` | no |
| file\_share\_retention\_policy\_in\_days | Storage Account file shares retention policy in days. | `number` | `null` | no |
| file\_shares | List of containers to create and their access levels. | `list(object({ name = string, quota = number }))` | `[]` | no |
| hour\_metrics | n/a | <pre>object({<br>    enabled               = bool<br>    version               = string<br>    include_apis          = bool<br>    retention_policy_days = number<br>  })</pre> | <pre>{<br>  "enabled": false,<br>  "include_apis": false,<br>  "retention_policy_days": 7,<br>  "version": ""<br>}</pre> | no |
| identity\_type | Specifies the type of Managed Service Identity that should be configured on this Storage Account. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both). | `string` | `"UserAssigned"` | no |
| index\_document | The name of the index document for the static website. | `string` | `"index.html"` | no |
| infrastructure\_encryption\_enabled | Is infrastructure encryption enabled? Changing this forces a new resource to be created. Defaults to false. | `bool` | `true` | no |
| is\_hns\_enabled | Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2. | `bool` | `false` | no |
| key\_opts | A list of key operations that the key supports. Possible values are `encrypt`, `decrypt`, `wrapKey`, `unwrapKey`, `sign`, `verify`, `get`, `list`, `create`, `update`, `import`, `delete`, `recover`, and `backup`. | `list(string)` | <pre>[<br>  "encrypt",<br>  "decrypt",<br>  "wrapKey",<br>  "unwrapKey",<br>  "sign",<br>  "verify"<br>]</pre> | no |
| key\_permissions | A list of key permissions to be applied for the key vault access policy. Possible values are `get`, `list`, `update`, `create`, `import`, `delete`, `recover`, `backup`, `restore`, `decrypt`, `encrypt`, `wrapKey`, `unwrapKey`, `sign`, and `verify`. | `list(string)` | <pre>[<br>  "Create",<br>  "Delete",<br>  "Get",<br>  "Purge",<br>  "Recover",<br>  "Update",<br>  "Get",<br>  "WrapKey",<br>  "UnwrapKey",<br>  "List",<br>  "Decrypt",<br>  "Sign",<br>  "Encrypt"<br>]</pre> | no |
| key\_size | The size of the key in bits. Possible values are `2048`, `3072`, and `4096` for RSA and `256` and `384` for EC. | `number` | `2048` | no |
| key\_type | The type of key to use. Possible values are `RSA` and `RSA-HSM`. | `string` | `"RSA"` | no |
| key\_vault\_id | #----------------------------------------------------------------------------- # Key Vault & CMK #----------------------------------------------------------------------------- | `string` | `null` | no |
| key\_vault\_rbac\_auth\_enabled | Specifies whether Role-Based Access Control (RBAC) is enabled for the Key Vault. | `bool` | `true` | no |
| label\_order | The order of labels used to construct resource names or tags. If not specified, defaults to ['name', 'environment', 'location']. | `list(any)` | <pre>[<br>  "name",<br>  "environment",<br>  "location"<br>]</pre> | no |
| large\_file\_share\_enabled | Is Large File Share Enabled? | `bool` | `false` | no |
| local\_user\_enabled | Specifies whether local users are enabled for the Storage Account. Defaults to true. | `bool` | `true` | no |
| location | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | `""` | no |
| log\_analytics\_destination\_type | Possible values are AzureDiagnostics and Dedicated, default to AzureDiagnostics. When set to Dedicated, logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table. | `string` | `"AzureDiagnostics"` | no |
| log\_analytics\_workspace\_id | log analytics workspace id to pass it to destination details of diagnosys setting of NSG. | `string` | `null` | no |
| logs | n/a | `list(string)` | <pre>[<br>  "StorageWrite",<br>  "StorageRead",<br>  "StorageDelete"<br>]</pre> | no |
| managedby | ManagedBy, eg 'terraform-az-modules'. | `string` | `"terraform-az-modules"` | no |
| management\_policy | Configure Azure Storage firewalls and virtual networks | <pre>list(object({<br>    prefix_match                                                   = set(string)<br>    tier_to_cool_after_days                                        = number<br>    tier_to_archive_after_days                                     = number<br>    delete_after_days                                              = number<br>    auto_tier_to_hot_from_cool_enabled                             = bool<br>    delete_after_days_since_creation_greater_than                  = number<br>    delete_after_days_since_last_access_time_greater_than          = number<br>    delete_after_days_since_modification_greater_than              = number<br>    tier_to_archive_after_days_since_creation_greater_than         = number<br>    tier_to_archive_after_days_since_last_access_time_greater_than = number<br>    tier_to_archive_after_days_since_last_tier_change_greater_than = number<br>    tier_to_archive_after_days_since_modification_greater_than     = number<br>    tier_to_cold_after_days_since_creation_greater_than            = number<br>    tier_to_cold_after_days_since_last_access_time_greater_than    = number<br>    tier_to_cool_after_days_since_modification_greater_than        = number<br>    tier_to_cool_after_days_since_creation_greater_than            = number<br>    tier_to_cool_after_days_since_last_access_time_greater_than    = number<br>    snapshot_delete_after_days                                     = number<br>  }))</pre> | <pre>[<br>  {<br>    "auto_tier_to_hot_from_cool_enabled": true,<br>    "delete_after_days": 100,<br>    "delete_after_days_since_creation_greater_than": 60,<br>    "delete_after_days_since_last_access_time_greater_than": 30,<br>    "delete_after_days_since_modification_greater_than": 365,<br>    "prefix_match": null,<br>    "snapshot_delete_after_days": 30,<br>    "tier_to_archive_after_days": 50,<br>    "tier_to_archive_after_days_since_creation_greater_than": 60,<br>    "tier_to_archive_after_days_since_last_access_time_greater_than": 30,<br>    "tier_to_archive_after_days_since_last_tier_change_greater_than": 60,<br>    "tier_to_archive_after_days_since_modification_greater_than": 90,<br>    "tier_to_cold_after_days_since_creation_greater_than": 90,<br>    "tier_to_cold_after_days_since_last_access_time_greater_than": 60,<br>    "tier_to_cool_after_days": 0,<br>    "tier_to_cool_after_days_since_creation_greater_than": 60,<br>    "tier_to_cool_after_days_since_last_access_time_greater_than": 60,<br>    "tier_to_cool_after_days_since_modification_greater_than": 30<br>  }<br>]</pre> | no |
| management\_policy\_enable | Enable or disable the creation of the management policy block. | `bool` | `false` | no |
| metrics | n/a | `list(string)` | <pre>[<br>  "Transaction",<br>  "Capacity"<br>]</pre> | no |
| min\_tls\_version | The minimum supported TLS version for the storage account | `string` | `"TLS1_2"` | no |
| minute\_metrics | n/a | <pre>list(object({<br>    enabled               = bool<br>    version               = string<br>    include_apis          = bool<br>    retention_policy_days = number<br>  }))</pre> | <pre>[<br>  {<br>    "enabled": false,<br>    "include_apis": false,<br>    "retention_policy_days": 7,<br>    "version": ""<br>  }<br>]</pre> | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| network\_rules | List of objects that represent the configuration of each network rule. | <pre>list(object({<br>    default_action             = string<br>    ip_rules                   = list(string)<br>    virtual_network_subnet_ids = optional(list(string), [])<br>    bypass                     = optional(list(string), [])<br>  }))</pre> | <pre>[<br>  {<br>    "bypass": [<br>      "AzureServices"<br>    ],<br>    "default_action": "Deny",<br>    "ip_rules": [],<br>    "virtual_network_subnet_ids": []<br>  }<br>]</pre> | no |
| nfsv3\_enabled | Is NFSv3 protocol enabled? Changing this forces a new resource to be created. | `bool` | `false` | no |
| private\_dns\_zone\_ids | The IDs of a private DNS zone. | `string` | `null` | no |
| private\_link\_access | List of Privatelink objects to allow access from. | <pre>list(object({<br>    endpoint_resource_id = string<br>    endpoint_tenant_id   = string<br>  }))</pre> | `[]` | no |
| public\_network\_access\_enabled | Whether the public network access is enabled? Defaults to true. | `bool` | `true` | no |
| queue\_encryption\_key\_type | The encryption type of the queue service. Possible values are 'Service' and 'Account'. | `string` | `"Account"` | no |
| queue\_logs | Log categories for Queue service diagnostics. | `list(string)` | <pre>[<br>  "StorageRead",<br>  "StorageWrite",<br>  "StorageDelete"<br>]</pre> | no |
| queue\_metrics | Metric categories for Queue service diagnostics. | `list(string)` | <pre>[<br>  "Transaction",<br>  "Capacity"<br>]</pre> | no |
| queue\_properties\_logging | Logging queue properties | <pre>object({<br>    delete                = optional(bool)<br>    read                  = optional(bool)<br>    write                 = optional(bool)<br>    version               = optional(string)<br>    retention_policy_days = optional(number)<br>  })</pre> | <pre>{<br>  "delete": true,<br>  "read": true,<br>  "retention_policy_days": 7,<br>  "version": "1.0",<br>  "write": true<br>}</pre> | no |
| queues | List of storages queues | `list(string)` | `[]` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/terraform-az-modules/terraform-azure-storage.git"` | no |
| resource\_group\_name | A container that holds related resources for an Azure solution | `string` | `""` | no |
| resource\_position\_prefix | Controls the placement of the resource type keyword (e.g., "vnet", "ddospp") in the resource name.<br><br>- If true, the keyword is prepended: "stor-core-dev".<br>- If false, the keyword is appended: "core-dev-stor".<br><br>This helps maintain naming consistency based on organizational preferences. | `bool` | `true` | no |
| restore\_policy | Wheteher or not create restore policy | `bool` | `false` | no |
| rotation\_policy | n/a | <pre>map(object({<br>    time_before_expiry   = string<br>    expire_after         = string<br>    notify_before_expiry = string<br>  }))</pre> | `null` | no |
| rotation\_policy\_enabled | Whether or not to enable rotation policy | `bool` | `false` | no |
| routing | n/a | <pre>list(object({<br>    publish_internet_endpoints  = bool<br>    publish_microsoft_endpoints = bool<br>    choice                      = string<br>  }))</pre> | <pre>[<br>  {<br>    "choice": "MicrosoftRouting",<br>    "publish_internet_endpoints": false,<br>    "publish_microsoft_endpoints": false<br>  }<br>]</pre> | no |
| sas\_policy\_settings | n/a | <pre>list(object({<br>    expiration_period = string<br>    expiration_action = string<br>  }))</pre> | <pre>[<br>  {<br>    "expiration_action": "Log",<br>    "expiration_period": "7.00:00:00"<br>  }<br>]</pre> | no |
| secret\_permissions | A list of secret permissions to be applied for the key vault access policy. Possible values are `get`, `list`, `set`, `delete`, `recover`, `backup`, `restore`, and `purge`. | `list(string)` | <pre>[<br>  "Get",<br>  "List",<br>  "Set",<br>  "Delete",<br>  "Recover",<br>  "Backup",<br>  "Restore",<br>  "Purge"<br>]</pre> | no |
| sftp\_enabled | Boolean, enable SFTP for the storage account | `bool` | `false` | no |
| shared\_access\_key\_enabled | Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). The default value is true. | `bool` | `true` | no |
| storage\_account\_id | Storage account id to pass it to destination details of diagnosys setting of NSG. | `string` | `null` | no |
| storage\_account\_name | Name of the Azure Storage Account. Must be globally unique, 3-24 characters long, and contain only lowercase letters and numbers. | `string` | `null` | no |
| storage\_blob\_cors\_rule | Storage Account blob CORS rule. Please refer to the [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#cors_rule) for more information. | <pre>object({<br>    allowed_headers    = list(string)<br>    allowed_methods    = list(string)<br>    allowed_origins    = list(string)<br>    exposed_headers    = list(string)<br>    max_age_in_seconds = number<br>  })</pre> | `null` | no |
| storage\_blob\_data\_protection | Storage account blob Data protection parameters. | <pre>object({<br>    change_feed_enabled                       = optional(bool, false)<br>    versioning_enabled                        = optional(bool, false)<br>    last_access_time_enabled                  = optional(bool, false)<br>    delete_retention_policy_in_days           = optional(number, 0)<br>    container_delete_retention_policy_in_days = optional(number, 0)<br>    container_point_in_time_restore           = optional(bool, false)<br>  })</pre> | <pre>{<br>  "change_feed_enabled": false,<br>  "container_delete_retention_policy_in_days": 7,<br>  "delete_retention_policy_in_days": 7,<br>  "last_access_time_enabled": false,<br>  "versioning_enabled": false<br>}</pre> | no |
| storage\_permissions | A list of storage permissions to be applied for the key vault access policy. Possible values are `get`, `list`, `delete`, `set`, `update`, `regeneratekey`, `setsas`, and `listsas`. | `list(string)` | <pre>[<br>  "Get",<br>  "List"<br>]</pre> | no |
| subnet\_id | The resource ID of the subnet | `string` | `""` | no |
| table\_encryption\_key\_type | The encryption type of the table service. Possible values are 'Service' and 'Account'. | `string` | `"Account"` | no |
| table\_logs | Log categories for Table service diagnostics. | `list(string)` | <pre>[<br>  "StorageRead",<br>  "StorageWrite",<br>  "StorageDelete"<br>]</pre> | no |
| table\_metrics | Metric categories for Table service diagnostics. | `list(string)` | <pre>[<br>  "Transaction",<br>  "Capacity"<br>]</pre> | no |
| tables | List of storage tables. | `list(string)` | `[]` | no |
| use\_subdomain | Should the Custom Domain Name be validated by using indirect CNAME validation? | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| containers | Map of Storage containers. |
| file\_shares | Map of Storage SMB file shares. |
| queues | Map of Storage Queues. |
| storage\_account\_id | The ID of the storage account. |
| storage\_account\_name | The name of the storage account. |
| storage\_account\_primary\_blob\_endpoint | The endpoint URL for blob storage in the primary location. |
| storage\_account\_primary\_location | The primary location of the storage account |
| storage\_account\_primary\_web\_endpoint | The endpoint URL for web storage in the primary location. |
| storage\_account\_primary\_web\_host | The hostname with port if applicable for web storage in the primary location. |
| storage\_primary\_access\_key | The primary access key for the storage account |
| storage\_primary\_connection\_string | The primary connection string for the storage account |
| tables | Map of Storage Tables. |

