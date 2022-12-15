terraform {
  backend "azurerm" {
    resource_group_name  = "rg-bureautique-iac"
    storage_account_name = "sabureautiqueiac"
    container_name       = "tfstate"
    key                  = "hHaDPumh62Eq7Aq3k61dW23xkM+cSeE27Tf3vCZF2E3dLLE4rPmnDA6aPUx+q1ceACufK1gqSyKX+AStk6evlg=="
  }
}

data "azurerm_virtual_network" "hub" {
  name                = "hub"
  resource_group_name = "networking"
}

module "rg" {
  source    = "../../resource_group"
  rg_name   = var.resource_group_name
  location  = var.location
}

module "spoke" {
  source              = "../../vnet"
  vnet_name           = var.vnet_spoke
  resource_group_name = module.rg.rg_name
  location            = var.location
  environment         = var.environment
  address_space       = var.vnet_spoke_address_space
  subnets             = var.spoke_subnets
  vnet_hub_peering    = var.vnet_hub_peering
  hub_vnet_peering    = var.hub_vnet_peering
  hub_vnet_name       = data.azurerm_virtual_network.hub.name
  hub_vnet_id         = data.azurerm_virtual_network.hub.id
  hub_resource_group_name = data.azurerm_virtual_network.hub.resource_group_name
}

module "nsg" {
  source              = "../../nsg"
  resource_group_name = module.rg.rg_name
  location            = module.rg.location
  security_group_name = var.security_group_name
  
  security_rules      = var.security_rules
  tags                = var.tags
}