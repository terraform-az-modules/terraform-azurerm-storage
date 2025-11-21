##-----------------------------------------------------------------------------
## Storage Account
##-----------------------------------------------------------------------------
output "storage_account_id" {
  value       = module.storage.storage_account_id
  description = "The ID of the storage account."
}

output "storage_account_name" {
  value       = module.storage.storage_account_name
  description = "The name of the storage account."
}

##-----------------------------------------------------------------------------
## Static website
##-----------------------------------------------------------------------------
output "static_website_url" {
  value       = module.storage.storage_account_primary_web_endpoint
  description = "The URL of the static website hosted in the storage account."
}
