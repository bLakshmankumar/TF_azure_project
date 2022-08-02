output "virtual_network" {
    value=azurerm_virtual_network.myvn
  
}

output "subnet" {
    value = azurerm_subnet.subnet
}