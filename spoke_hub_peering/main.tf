resource "azurerm_virtual_network_peering" "spoke-hub-peer" {
    name                          = "spoke-hub-peer"
    resource_group_name           = var.resource_group_name
    virtual_network_name          = var.spoke_vnet.name
    remote_virtual_network_id     = var.hub_vnet.id

    allow_virtual_network_access  = true
    allow_forwarded_traffic       = true
    allow_gateway_transit         = false
    use_remote_gateways           = true
    depends_on = [var.spoke_vnet, var.hub_vnet]
}

resource "azurerm_virtual_network_peering" "hub-spoke-peer" {
    name                          = "hub-spoke-peer"
    resource_group_name           = var.resource_group_name
    virtual_network_name          = var.hub_vnet
    remote_virtual_network_id     = var.spoke_vnet.id
    allow_virtual_network_access  = true
    allow_forwarded_traffic       = true
    allow_gateway_transit         = true
    use_remote_gateways           = false
    depends_on = [azurerm_virtual_network.spoke_vnet, azurerm_virtual_network.hub_vnet]
}