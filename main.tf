# Configuration for Terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = "~>2.38.0"
    }
  }
}

# Configuration fro Azure Terraform Provider
provider "azurerm" {
  features {

  }
}

# Data Section
data "azurerm_resource_group" "res_group" {
  name = "resource-group-tutorial-1"
}

#Resource section
resource "azurerm_storage_account" "storage_account" {
  name                     = "storageaccounttutorial2"
  resource_group_name      = data.azurerm_resource_group.res_group.name
  location                 = data.azurerm_resource_group.res_group.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = var.replication_type
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "storage-container-tutorial-2"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}
