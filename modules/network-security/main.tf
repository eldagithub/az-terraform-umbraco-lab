resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }

}

resource "azurerm_virtual_network" "vnet" {
  name                = "UMBROCO-VNET"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }

}

resource "azurerm_subnet" "dbsubnet" {
  name                 = "UMBROCO-DB-SUBNET"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"]


}


resource "azurerm_network_security_group" "dbnsg" {
  name                = "UMBROCO-DB-NSG"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "allow-appservice-inbound-to-db"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3306" 
    source_address_prefix      = "AppService" 
    destination_address_prefix = "VirtualNetwork"
  }

}

resource "azurerm_subnet_network_security_group_association" "dbnsg_association" {
  subnet_id                 = azurerm_subnet.dbsubnet.id
  network_security_group_id = azurerm_network_security_group.dbnsg.id
}

