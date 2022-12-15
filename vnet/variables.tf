variable "resource_group_name" {
  description = "Nom du resource group du vnet"
  type        = string
}

variable "hub_resource_group_name" {
  description = "Nom du resource group du vnet"
  type        = string
}

variable "vnet_name" {
  description = "Nom du vnet"
  type        = string
}

variable "hub_vnet_name" {
  description = "Nom du vnet hub"
  type        = string
}

variable "hub_vnet_id" {
  description = "id du vnet hub"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "environment" {
  type        = string
}

variable "address_space" {
  description = "subnet of the vnet"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets"
  type        = map
}

variable "vnet_hub_peering" {
  description = "nom du peering vnet-hub"
  type = string
}

variable "hub_vnet_peering" {
  description = "nom du peering hub-vnet"
  type = string
}