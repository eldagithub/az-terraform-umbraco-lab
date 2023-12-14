output "app_name" {
  value = azurerm_windows_web_app.app.name
}

output "app_id" {
  value = azurerm_windows_web_app.app.id
}

output "default_site_hostname" {
  value = azurerm_windows_web_app.app.default_hostname
}
