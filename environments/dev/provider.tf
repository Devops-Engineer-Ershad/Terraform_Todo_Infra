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
        storage_account_name = "donotdeletestorage5"
        container_name       = "tfstate"
        key                  = "dev.terraform.state"
      
    }
}

provider "azurerm" {
    features {}
  subscription_id = "ff1980ab-1170-4014-971d-df65aabf1e5b"
}
