resource "azurerm_storage_account" "storage" {
  name                     = var.storage_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"


  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }

}

resource "azurerm_storage_container" "container" {
  name                  = "blob-container"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"

}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}
