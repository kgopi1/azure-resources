resource "azurerm_resource_group" "azure" {
  name     = "rg-${var.appname}"
  location = "east us"
}

resource "azurerm_service_plan" "azure" {
  name                = "asp--${var.appname}"
  resource_group_name = azurerm_resource_group.azure.name
  location            = azurerm_resource_group.azure.location
  os_type             = "Windows"
  sku_name            = "P1v2"
}

resource "azurerm_application_insights" "azure" {
  name                = "ai-${var.appname}"
  location            = azurerm_resource_group.azure.location
  resource_group_name = azurerm_resource_group.azure.name
  application_type    = "web"
}

resource "azurerm_app_service" "azure" {
  name                = "app-${var.appname}"
  location            = azurerm_resource_group.azure.location
  resource_group_name = azurerm_resource_group.azure.name
  app_service_plan_id = azurerm_service_plan.azure.id

  site_config {  }

  app_settings = { 
    "APPINSIGHTS_INSTRUMENTATIONKEY" = "${azurerm_application_insights.azure.instrumentation_key}"
  }
}