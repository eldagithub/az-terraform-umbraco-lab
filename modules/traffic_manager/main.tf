resource "azurerm_traffic_manager_profile" "tm" {
  name                   = "${var.tm_name}-tm"
  resource_group_name    = var.resource_group_name
  traffic_routing_method = "Priority"

  dns_config {
    relative_name = "${var.tm_name}"
    ttl           = 60
  }

  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }

}
