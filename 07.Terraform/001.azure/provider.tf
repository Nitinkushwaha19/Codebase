terraform {
  required_version = ">=1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.59.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "8d17b21f-97ad-45a1-990b-6d9f82ea7e7b"
}
