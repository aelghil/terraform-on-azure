location                    = "canadacentral"
resource_group_name         = "rg_bur"
vnet_spoke                  = "spoke_bur"
environment                 = "dev"
vnet_spoke_address_space         = ["10.0.0.0/16"]
vnet_hub_address_space           = ["10.1.0.0/16"]
spoke_subnets                     = {
    "a" = "10.0.2.0/24"
    "b" = "10.0.4.0/24"
}
hub_subnets                     = {
    "a" = "10.1.2.0/24"
    "b" = "10.1.4.0/24"
}
security_rules = [ {
  access = "Allow"
  destination_address_prefix = "10.0.2.2/32"
  #destination_address_prefixes = [ "value" ]
  destination_port_range = "8080"
  #destination_port_ranges = [ "value" ]
  direction = "Outbound"
  name = "nsg_8080"
  priority = 100
  protocol = "Tcp"
  source_address_prefix = "10.0.4.2/32"
  #source_address_prefixes = [ "value" ]
  source_port_range = "1234"
  #source_port_ranges = [ "value" ]
},
{
    priority  = 200
    name      = "nsg_22"
    direction = "Inbound"
    access    = "Allow"
    protocol  = "Tcp"
    #source_port_range  = optional(string)
    source_port_ranges = ["26", "25"]
    #destination_port_range  = optional(string)
    destination_port_ranges = ["22"]
    #source_address_prefix   = optional(string)
    source_address_prefixes = ["10.0.2.6/32", "10.0.2.4/32"]
    #destination_address_prefix   = optional(string)
    destination_address_prefixes = ["10.0.4.6/32", "10.0.4.4/32"]
}
]   
vnet_hub_peering = "spoke_hub_peer"
hub_vnet_peering = "hub_spoke_peer"