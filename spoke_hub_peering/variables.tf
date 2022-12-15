variable "resource_group_name" {
  description = "Name of the resource group of the spoke"
  type        = string
}

variable "spoke_vnet" {
  description = "vnet of the spoke"
  type    = map
}

variable "hub_vnet" {
  description = "vnet of the hub"
  type    = map
}