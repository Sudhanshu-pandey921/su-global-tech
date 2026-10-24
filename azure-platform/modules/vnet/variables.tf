variable "vnet-name" {
    description = "Virtual network name"
    type = string
}

variable "location" {
    description = "value"
}

variable "address_space" {
  description = "VNet address ranges"
  type        = list(string)
}

variable "rg-name" {
  description = "Resource group containing the VNet"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}