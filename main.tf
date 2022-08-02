module "genral_module" {
  source="./modules/general"
  resource_group_name="${azurerm_resource_group.rg1.name}"
  location="${azurerm_resource_group.rg1.location}"
}


module "networnking_module" {
  source = "./module/netwoking"
  name     = "${var.resource_gn}"
  location = "${var.location}"
  vnetname = "${var.vnetname}"
  vnetaddress_space = "${var.vnetaddress_space}"
  subnet_names = "${var.subnet_names}"
  
}
