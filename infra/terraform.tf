# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
     }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name   = "tf_rg"
    storage_account_name  = "storagetf123456"
    container_name        = "container"
    key                   = "app-${var.appname}.tfstate"
    
  }
}
