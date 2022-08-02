#include genral module for dependecy
module "general_module" {
    source=".././genral"
    resource_group_name="${azurerm_resource_group.rg1.name}"
    location="${azurerm_resource_group.rg1.location}"  
}

#Create VNET with CIDR Range

resource "azurerm_virtual_network" "myvn" {
  name                = "${var.vnetname}"
  resource_group_name = "${azurerm_resource_group.rg1.name}"
  location            = "${azurerm_resource_group.rg1.location}"
  address_space       = "${var.vnet_address_space}"
  depends_on = [
    module.genral_module.rg1
  ]

}

# Create SUBNET 

resource "azurerm_subnet" "subnet" {
  name                 = "${var.subnet_name}"
  resource_group_name  = "${azurerm_resource_group.rg1.name}"
  virtual_network_name = "${azurerm_virtual_network.myvn.name}"
  address_prefixes     = "${var.sn_address_prefixes}"

  depends_on = [
    azurerm_virtual_network.myvn
  ]

}

#create subnet for bastion
resource "azurerm_subnet" "bastion_subnet" {
  name                 = "${var.bastion_subnet}"
  resource_group_name  = "${azurerm_resource_group.rg1.name}"
  virtual_network_name = "${azurerm_virtual_network.myvn.name}"
  address_prefixes     = "${var.bastion_subnet}"

  depends_on = [
    azurerm_virtual_network.myvn
  ]

}

#create public_ip(pip) for bastion host
resource "azurerm_public_ip" "bastion_pip" {
  name                = "${var.bastion_host_name}pip"
  location            = "${azurerm_resource_group.rg1.location}"
  resource_group_name = "${azurerm_resource_group.rg1.name}"
  allocation_method   = "Static"
  sku                 = "Standard"
}
# create bastion host
resource "azurerm_bastion_host" "app_bastion_host" {
  name                = "${var.bastion_host_name }"
  location            = "${azurerm_resource_group.rg1.location}"
  resource_group_name = "${azurerm_resource_group.rg1.name}"

  ip_configuration {
    name                 = "bastion_configuration"
    subnet_id            = azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
}

#create NSG AND Association 
# create NW Security Rules

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.nsg_name}"
  location            = "${azurerm_resource_group.rg1.location}"
  resource_group_name = "${azurerm_resource_group.rg1.name}"
  depends_on = [
    azurerm_virtual_network.myvn
  ]
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = azurerm_subnet.myvn_subnet
  network_security_group_id = azurerm_network_security_group.nsg.id

  depends_on = [
    azurerm_virtual_network.myvn,
    azurerm_network_security_group.nsg
  ]

}

#network_security_rule
resource "azurerm_network_security_rule" "nsr" {
  name                        = "test123"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.rg1.name}"
  network_security_group_name = "${azurerm_network_security_group.nsg.name}"
  
}


