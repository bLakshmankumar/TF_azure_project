# IGW
#resource "azurerm_subnet" "IGW" {
#  name                 = "gatewaysubnet"
#  resource_group_name  = azurerm_resource_group.rg1.location
#  virtual_network_name = azurerm_virtual_network.myvn.name
#  address_prefixes     = ["192.16.2.0/24"]
#}

#Create app_service Environment
#resource "azurerm_app_service_environment" "Azure_ASE" {
#  name                         = "app_service_environmet"
#  resource_group_name          = azurerm_resource_group.rg1.name
#  subnet_id                    = azurerm_subnet.myvn_subnet.name
#  pricing_tier                 = "I2"
#  front_end_scale_factor       = 10
#  internal_load_balancing_mode = "Web, Publishing"
#  allowed_user_ip_cidrs        = ["11.22.33.44/32", "55.66.77.0/24"]

 # cluster_setting {
 #   name  = "DisableTls1.0"
 #   value = "1"
 # }
#}
