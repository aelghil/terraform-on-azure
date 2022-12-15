variable "resource_group_name" {
  description = "Nom du resource group"
  type        = string
}

variable "vnet_spoke" {
  description = "Nom du vnet"
  type        = string
}

#variable "vnet_hub" {
#  description = "Nom du vnet"
#  type        = string
#}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "canadacentral"
}

variable "environment" {
  description = "Environnement: dev ou prod"
  type        = string
  default     = "dev"
}

variable "vnet_spoke_address_space" {
  description = "subnet of the spoke"
  type        = list(string)
}

variable "vnet_hub_address_space" {
  description = "subnet of the spoke"
  type        = list(string)
}

variable "spoke_subnets" {
  description = "La liste des subnets"
  type        = map(string)
}

variable "hub_subnets" {
  description = "La liste des subnets"
  type        = map(string)
}

variable "security_group_name" {
  description = "Name of the network security group"
  default     = "nsg"
}

variable "tags" {
  description = "The tags to associate with your network security group."
  type        = map(string)
  default     = {}
}

variable "security_rules" {
  description = "Network security group rules to add. For arguements please refer to https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule#argument-reference"
  type = list(object({
    priority  = number
    name      = string
    direction = optional(string, "Inbound")
    access    = optional(string, "Allow")
    protocol  = optional(string, "Tcp")

    source_port_range  = optional(string)
    source_port_ranges = optional(list(string))

    destination_port_range  = optional(string)
    destination_port_ranges = optional(list(string))

    source_address_prefix   = optional(string)
    source_address_prefixes = optional(list(string))

    destination_address_prefix   = optional(string)
    destination_address_prefixes = optional(list(string))
  }))
  default = []
}

variable "source_address_prefix" {
  type    = list(any)
  default = ["*"]

  # Example: ["10.0.3.0/24"]
}

variable "destination_address_prefix" {
  type    = list(any)
  default = ["*"]

  # Example: ["10.0.3.0/32","10.0.3.128/32"]
}

variable "vnet_hub_peering" {
  description = "nom du peering vnet-hub"
  type = string
}

variable "hub_vnet_peering" {
  description = "nom du peering hub-vnet"
  type = string
}