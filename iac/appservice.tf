# RANDOM PET PARA GARANTIZAR NOMBRE ÚNICO A NIVEL MUNDIAL DEL WEB APP
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "asp-tarea3-backend"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "F1" # Máquina gratuita
}

resource "azurerm_linux_web_app" "app_service" {
  name                = "appsvc-tarea3-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    application_stack {
      node_version = "20-lts"
    }
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}

output "app_service_url" {
  value = azurerm_linux_web_app.app_service.default_hostname
}
