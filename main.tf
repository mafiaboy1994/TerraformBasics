# Azure Provider source and version being used
terraform {
    required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "=2.71.0"
      }
    }   
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "myrg" {
    name = "elijahsrg"
    location = "UK South"
}

#create virtual network within the resource group
resource "azurerm_virtual_network" "myvnet" {
    name = "elijahs-vnet"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    address_space = ["10.0.0.0/16"]
}

# Create a subnet within a vnet
resource "azurerm_subnet" "mysubnet" {
    name = "elijah-subnet"
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes = ["10.0.1.0/24"]
}

