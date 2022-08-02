resource "azurerm_log_analytics_workspace" "db_wrokspace" {
  name                = "${var.sql_auditing}"
  location            = "${azurerm_resource_group.rg1.location}"
  resource_group_name = "${azurerm_resource_group.rg1.name}"
  sku                 = "PerGB2018"
  retention_in_days   = 30
  depends_on = [
    azurerm_resource_group.rg1
  ]
}

extended_auditing_policy {
    #storage_endpoint                        = azurerm_storage_account.storage_account.primary_blob_endpoint
    #torage_account_access_key              = azurerm_storage_account.storage_account.primary_access_key
    #storage_account_access_key_is_secondary = false
    retention_in_days                       = 30
    log_monitoring_enabled = true
}
#                              (or)
# audit_policy {
   # actions                        = example_actions
    #retention_days                 = 30
    #state                          = enabled
    #storage_account                = azurerm_storage_account
   #storage_endpoint               = azurerm_storage_account.storage_account.primary_blob_endpoint (optional)
   #storage_key                    = storage_key (optional)
   #log_analytics_workspace_id     = example_log_analytics_workspace_id
   #eventhub_authorization_rule_id = example_authorization_rule_id
  #}

# After setting the audit policy we need to enable the diagnostic setting it's a part of azure monitor

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name               = "${var.diagnostic_audit_settting}"
  target_resource_id = "${azurerm_sql_database.id}"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.db_wrokspace.id
  
  #storage_account_id = data.azurerm_storage_account.example.id(it's optional)
  #under log category we need to mention which logs we wanna monitor(security, SQLinsghts, Automaticturning or anything else)
  log {
    category = "SQLInsights" 
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
  depends_on = [
    azurerm_log_analytics_workspace.db_wrokspace,
    azurerm_sql_database.staging_db
  ]

}
