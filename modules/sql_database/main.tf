resource "azurerm_mssql_server" "sql_server" {
  name                         = "sqlserver-${var.db_name}"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0" # Use the appropriate version

  public_network_access_enabled = false

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }

}


resource "azurerm_mssql_database" "sql_db" {
  name                = var.db_name
  server_id           = azurerm_mssql_server.sql_server.id
 

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }

}

resource "azurerm_private_endpoint" "db_private-endpoint" {
  name                = "db-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.db_subnet_id

  private_service_connection {
    name                           = "db-private-connection"
    private_connection_resource_id = azurerm_mssql_server.sql_server.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
}
