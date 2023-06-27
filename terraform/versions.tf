terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.62.1"
    }
  }

  # >= 1.0.0           - Versions greater than or equal to the 1.0.0.
  # <= 1.0.0           - Versions lesser than or equal to 1.0.0.
  # >= 1.0.0, <= 2.0.0 - This includes all versions between 1.0.0 and version number 2.0.0
  # ~> 1.0.0           - Any non-beta version greater than or equal to 1.0.0 and lesser than or equal to 1.1.0.
  # ~> 1.1             - Any non beta version greater than equal to 1.1.0 and lesser than 2.0
}

provider "azurerm" {
  features {}
}