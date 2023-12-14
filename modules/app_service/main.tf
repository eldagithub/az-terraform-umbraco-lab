resource "azurerm_service_plan" "plan" {
  name                = "asp-${var.app_name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type             = "Windows"
  sku_name            = var.service_plan_sku_name

  
  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }

}

resource "azurerm_windows_web_app" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id = azurerm_service_plan.plan.id

  site_config {

    ip_restriction {
      ip_address = var.allowed_endusers_cidr
      action     = "Allow"
      priority   = 100
      name       = "IPRestrictionRule"
    }

  }

  app_settings = {
    "SOME_SETTING" = "some value" # Replace with your application settings
  }
  
  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }

}


resource "azurerm_traffic_manager_azure_endpoint" "endpoint" {
  name                = azurerm_windows_web_app.app.name 
  profile_id          = var.tm_profile_id 
  target_resource_id  = azurerm_windows_web_app.app.id
  priority            = var.priority

  depends_on = [azurerm_windows_web_app.app]
}
