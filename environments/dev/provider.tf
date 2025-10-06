terraform {
    required_version = ">= 1.13.0"

    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "4.41.0"
        }
    }

    backend "azurerm" {
        resource_group_name  = "DoNotDeleteRg"
        storage_account_name = "donotdeletestorage555"
        container_name       = "tfstate"
        key                  = "dev1.terraformstate"
      
    }
}

provider "azurerm" {
    features {}
  subscription_id = "c24701f5-28b9-4143-94b8-dfab761abc82"
}
