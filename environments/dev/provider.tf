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
        storage_account_name = "donotdeletestorage55"
        container_name       = "tfstate"
        key                  = "dev.terraform.state"
      
    }
}

provider "azurerm" {
    features {}
  subscription_id = "9ea53555-e829-4a44-979e-046e7d148cb5"
}
