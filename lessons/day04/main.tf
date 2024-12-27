terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.8.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-day04"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "day0420992"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
  required_version = ">=1.9.0"
}

provider "azurerm" {
    features {
      
    }
    subscription_id = "8cbe2d42-5cde-4551-9e4d-dde06c043c64"
}

resource "azurerm_resource_group" "azday04RG" {
  name     = "azday04RG"
  location = "West Europe"
}

resource "azurerm_storage_account" "azday04RG" {
 
  name                     = "techtutorial101hilful"
  resource_group_name      = azurerm_resource_group.azday04RG.name
  location                 = azurerm_resource_group.azday04RG.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
