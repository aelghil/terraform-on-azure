resource "azurerm_network_security_group" "nsg" {
  name                = var.security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_rule" "security_rules" {
  for_each                    = { for security_rule in var.security_rules : security_rule.name => security_rule }
  name                        = each.value.name
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = var.resource_group_name

  priority  = each.value.priority
  direction = coalesce(each.value.direction, "Inbound")
  access    = coalesce(each.value.access, "Allow")
  protocol  = coalesce(each.value.protocol, "Tcp")

  source_port_range  = each.value.source_port_range
  source_port_ranges = each.value.source_port_ranges

  destination_port_range  = each.value.destination_port_range
  destination_port_ranges = each.value.destination_port_ranges

  source_address_prefix   = each.value.source_address_prefix
  source_address_prefixes = each.value.source_address_prefixes

  destination_address_prefix   = each.value.destination_address_prefix
  destination_address_prefixes = each.value.destination_address_prefixes
}