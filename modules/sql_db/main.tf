resource "azurerm_sql_server" "db_server" {
  name                         = "${var.sql_server_name}"
  resource_group_name          = "${azurerm_resource_group.rg1.name}"
  location                     = "${azurerm_resource_group.rg1.location}"
  version                      = "12.0"
  administrator_login          = "${var.admin_username}"
  administrator_login_password = "${var.login_passwd}"

  tags = {
    environment = "staging"
  }
}

#create Azure storage account
resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.staging_storage_account}"
  resource_group_name      = "${azurerm_resource_group.rg1.name}"
  location                 = "${azurerm_resource_group.rg1.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

#create azure Sql _db Server
resource "azurerm_sql_database" "staging_db" {
  name                = "${var.azurerm_sql_database}"
  resource_group_name = "${azurerm_resource_group.rg1.name}"
  location            = "${azurerm_resource_group.rg1.location}"
  server_name         = azurerm_sql_server.db_server

# Here also we can mention our auditpolicy for db
}

#create sql firewall rule
resource "azurerm_sql_firewall_rule" "Fw_sql" {
  name                = "${var.Db_firewall}"
  resource_group_name = "${azurerm_resource_group.rg1.name}"
  server_name         = azurerm_sql_server.db_server.name
  start_ip_address    = "${var.sql_start_ip}"
  end_ip_address      = "${var.sql_end_ip}"
  depends_on = [
    azurerm_sql_server.db_server
  ]
}