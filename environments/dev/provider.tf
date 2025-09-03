terraform {
    required_version = ">= 1.13.0"

    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "4.41.0"
        }
    }

    backend "azurerm" {
        resource_group_name  = "rg-ershad"
        storage_account_name = "ershadstorage"
        container_name       = "ershadcontainer"
        key                  = "rg.terraformstate"
      
    }
}

provider "azurerm" {
    features {}
  subscription_id = "52172e85-52db-422d-b74e-9204936ad848"
}
