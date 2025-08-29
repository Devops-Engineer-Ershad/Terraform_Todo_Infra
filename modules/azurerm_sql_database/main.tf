resource "azurerm_mssql_database" "sql_database" {
    name               = var.sql_database_name
    server_id          = var.server_id
    sku_name           = "S0"
    max_size_gb        = var.max_size_gb
    collation          = "SQL_Latin1_General_CP1_CI_AS"
    enclave_type       = "VBS"
    tags               = var.tags
}

