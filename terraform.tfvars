#Provider Resources
subscription_id = "*******************"
client_id       = "*******************"
client_secret   = "************"
tenant_id       = "*********"

#Resource_group
service_plan_name  = "staging_svc_plan_name"
app_service_name  = "staging_app_service"

# Network Resources
resource_gn     = "app_service_group"
location        = "West US"
service_plan    = "my_app_service_plan"
vnetname        = "myvnet01"
subnet_name     = "mysnet01"
vnetaddress_space = ["*.*.*.*/16"]
sn_address_prefixes = ["*.*.*.*/24"]
bastion_host_name = "bastion_client"
bastion_subnet  = ["*.*.*.*/24"]
nsg_name        = "my_nsg"

#db resources 
//azurerm_sql_database    = "my_stagnig_db"
//db_server_name          = "unique_db***"
//admin_username          = "*********"
//login_passwd            = "*********"
//sql_server_name         = "my_staging_db_server"
//staging_storage_account = "my_azure_srg_acnt"
//Db_firewall             = "sql_firewall"
//sql_start_ip            = ["*.*.*.*"]
//sql_end_ip              = ["*.*.*.*"]

#DB_log_auditing_

sql_auditing_name = "db_wrokspace_audit"
diagnostic_audit_settting = "app_diagnostic_setting"