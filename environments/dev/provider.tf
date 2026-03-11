terraform {
    required_version = ">= 1.13.0"

    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "4.41.0"
        }
    }

    backend "azurerm" {
        resource_group_name  = "DoNotDeleteRG"
        storage_account_name = "donotdeletestorage55"
        container_name       = "tfstate"
        key                  = "dev.terraform.state"
      
    }
}

provider "azurerm" {
    features {}
  subscription_id = "42ef39d4-890a-43c3-9c88-fc38b8fb9943"
}
