locals {
  common_tags = {
    "managed_by" = "terraform"
    "environment" = "dev"
    "owner" = "ershadalam"
  }
}
module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rg_name = "rg-todo-dev"
  location = "East US"
  tags = local.common_tags
}
# module "storage_account" {
#   depends_on = [ module.resource_group ]
#   source = "../../modules/azurerm_storage_account"
#   sa_name = "todostorage"
#   rg_name = "rg-todo-dev"
#   location = "East US"
#   tags = local.common_tags
# }
module "container_registry" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm_container_registry"
  acr_name = "todoazureacr1"
  rg_name = "rg-todo-dev"
  location = "East US"
  tags = local.common_tags
}

 module "sql_server" {
 depends_on = [ module.resource_group ]
 source = "../../modules/azurerm_mssql_server"
 sql_server_name = "todoserver123"
 rg_name = "rg-todo-dev"
 location = "centralindia"
 admin_username = "sqladminuser"
 admin_password = "P@ssword1234"
 tags = local.common_tags
 }
 module "kubernetes_cluster" {
 depends_on = [ module.resource_group ]
 source = "../../modules/azurerm_kubernetes_cluster"
 aks_name = "todoakscluster"
 rg_name = "rg-todo-dev"
 location = "East US"
 dns_prefix = "todoaksdns"
 tags = local.common_tags
 }
# module "key_vault" {
#   depends_on = [ module.resource_group ]
#   source = "../../modules/azurerm_key_vault"
#   kv_name = "todokeyvault"
#   rg_name = "rg-todo-dev"
#   location = "East US"
#   tags = local.common_tags
# }
   module "sql_database" {
   depends_on = [ module.sql_server ]
   source = "../../modules/azurerm_sql_database"
   sql_database_name = "tododb123"
   server_id = module.sql_server.server_id
   max_size_gb = "2"
   tags = local.common_tags
}
