resource "azurerm_static_site" "static_web_app" {
  name                = "stapp-tarea3-frontend"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "East US 2" # Location compatible con Static Web Apps
  sku_tier            = "Standard"
  sku_size            = "Standard"
}

# Variable de salida para ver fácilmente el token y la URL. Útil para poder configurar Github Actions
output "static_web_app_url" {
  value = azurerm_static_site.static_web_app.default_host_name
}

output "static_web_app_api_token" {
  value     = azurerm_static_site.static_web_app.api_key
  sensitive = true
}
