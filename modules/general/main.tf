resource "azurerm_resource_group" "rg1" {
  name     = "${var.resource_gn}"
  location = "${var.location}"
}
