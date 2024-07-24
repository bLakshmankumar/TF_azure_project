# Create azure Network_Interface
# ==============================
//resource "azurerm_network_interface" "nic" {
 // name                = "webinterface"
 // location            = azurerm_resource_group.rg1.location
 // resource_group_name = azurerm_resource_group.rg1.name

 // ip_configuration {
 //   name                          = "internal"
  //  subnet_id                     = azurerm_subnet.myvn_subnet.id
   // private_ip_address_allocation = "Dynamic"
    //public_ip_address_id = azurerm_public_ip.web_ip
 // }
//}

//resource "azurerm_public_ip" "web_ip" {
 // name                = "staging_pip"
 // resource_group_name = azurerm_resource_group.rg1.name
 // location            = azurerm_resource_group.rg1.location
  //allocation_method   = "Static"

 // tags = {
  //  environment = "staging"
  //}
//}



