variable "resource_gn" {
    type = string
    description = "this defines the name of the vnet resource group"
}

variable "locatiion" {
    type = string
    description = "this defines the name of the vnet location"
}

variable "vnetname" {
    type = string
    description = "this defines the name of the vnet"
}

variable "vnetaddress_space" {
  type = string
  description = "this defines the name of the vnetaddress_space"
}

variable "subnet_name" {
    type =string
    description = "this defines the subnet name"
}

variable "sn_address_prefixes" {
  type=string
  description = "this defines the subnets within the virtual network"
}

variable "bastion_host_name " {
    type = string
    description = "this defines the bastion_name"
}

variable "bastion_subnet" {
    type = string
    description = "this defines the bastion_subnet"
  
}
variable "nsg_name" {
    type=string
    description = "this defines the nsg names"
  
}