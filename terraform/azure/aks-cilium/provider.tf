provider "azurerm" {
  features {
  }
    # subscription_id = "f19d89ef-9ae1-4270-8cbe-1416edfd4f95"
    subscription_id = "159e707f-cc79-444b-b87a-9711f141429b"
}
#Configure the storage for terraform state
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}
