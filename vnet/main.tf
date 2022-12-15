resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  tags = {
    environment = var.environment
  }
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  name                 = "${var.vnet_name}-subnet-${each.key}-${var.environment}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${each.value}"]
}


resource "azurerm_virtual_network_peering" "vnet-hub-peer" {
    name                          = var.vnet_hub_peering
    resource_group_name           = azurerm_virtual_network.vnet.resource_group_name
    virtual_network_name          = azurerm_virtual_network.vnet.name
    remote_virtual_network_id     = var.hub_vnet_id

}

resource "azurerm_virtual_network_peering" "hub-vnet-peer" {
    name                          = var.hub_vnet_peering
    resource_group_name           = var.hub_resource_group_name
    virtual_network_name          = var.hub_vnet_name
    remote_virtual_network_id     = azurerm_virtual_network.vnet.id
}