data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
    name                        = var.kv_name
    location                    = var.location
    resource_group_name         = var.rg_name
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    sku_name                    = "standard"
    purge_protection_enabled    = false
    soft_delete_retention_days  = 7
    enabled_for_disk_encryption = true
    tags                        = var.tags
    
    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id
    
        key_permissions = [
        "Get",
        "List",
        "Set",
        "Delete",
        ]
    
        secret_permissions = [
        "Get",
        "List",
        "Set",
        "Delete",
        ]
    
        certificate_permissions = [
        "Get",
        "List",
        "Create",
        "Delete",
        
        ]
    }
}