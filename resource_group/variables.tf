# Network Security Group definition
variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location (Azure Region) for the network security group."
  # No default - if it's not specified, use the resource group location (see main.tf)
  type    = string
  default = ""
}
