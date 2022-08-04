# Here we define resources required for our application to run

resource "azurerm_app_service_plan" "appplan" {
  name                = "${var.service_plan_name}"
  location            = "${var.locatiion}"
  resource_group_name = "${azurerm_resource_group.rg1.name}"
  sku {
    size = "S1"
    tier = "Standard"
  }

}
# create app service with dotnet 6.0 version

resource "azurerm_app_service" "appservice" {
  name                = "${var.app_service_name}"
  location            = "${azurerm_resource_group.rg1.location}"
  app_service_plan_id = azurerm_app_service_plan.appplan.id
  resource_group_name = "${azurerm_resource_group.rg1.name}"

  site_config {
    dotnet_framework_version = "v6.0"
  }

}
