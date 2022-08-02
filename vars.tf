variable "subscription_id" {
  type = string

}

variable "client_id" {
  type = string

}

variable "client_secret" {
  type = string

}

variable "tenant_id" {
  type = string

}
variable "resource_gn" {
    type = string
  
}

variable "locatiion" {
    type = string
  
}

variable "service_plan" {
    type = string
  
}

variable "vnetname" {
    type = string

}

variable "vnetaddress_space" {
  type = string
}

variable "subnet_name" {
    type = string
}

variable "sn_address_prefixes" {
    type = string
  
}

variable "bastion_host_name " {
    type = string
}

variable "bastion_subnet" {
    type = string 
}

variable "nsg_name" {
    type=string
    description = "this defines the nsg names" 
}
