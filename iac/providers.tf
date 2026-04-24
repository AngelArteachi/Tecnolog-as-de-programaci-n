terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  # El prefijo rg (Resource Group) seguido de tu identificador.
  name     = "rg-tarea3-seguridad"
  location = "East US"
}
