variable "azurerm_sql_database" {
    type = string
    description = "this will define the db name"
  
}

variable "admin_username " {
    type = string
    description = "this defines the aadmin_uname"
  
}

variable "login_passwd" {
    type = string
    description = "this defines the aadmin_uname"
  
}

variable "sql_server_name" {
    type = string
    description = "this defines the aadmin_uname"
  
}

variable "staging_storage_account" {
    type = string
    description = "this defines the db server name"
  
}

variable "db_server_name" {
    type = string
    description = "this defines the db server name"
  
}

variable "Db_firewall" {
    type = string
    description = "this defines the db firewall"
  
}


variable "sql_start_ip" {
    type = string
    description = "this defines the db start_ip"
  
}

variable "sql_end_ip" {
    type = string
    description = "this defines the db end_ip"
  
}


