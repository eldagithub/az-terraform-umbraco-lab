output "rg_name" {
  value = azurerm_resource_group.rg.name
}

output "db_subnet_id" {
  value = azurerm_subnet.dbsubnet.id
}



