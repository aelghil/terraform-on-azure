output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = module.spoke.vnet_address_space
}

output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = module.spoke.vnet_id
}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = module.spoke.vnet_location
}

output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = module.spoke.vnet_name
}

output "vnet_subnets" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = module.spoke.subnets
}

output "network_security_group_id" {
  value = module.nsg.network_security_group_id
}

output "network_security_group_name" {
  value = module.nsg.network_security_group_name
}

#output "hub_resource_group_name" {
#  value = data.azurerm_virtual_network.hub.resource_group_name
#}
#
#output "hub_vnet_name" {
#  value = data.azurerm_virtual_network.hub.name
#}
#
#output "hub_vnet_id" {
#  value = data.azurerm_virtual_network.hub.id
#}