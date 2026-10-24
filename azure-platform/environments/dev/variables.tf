variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "location" {

}



variable "vnet_name" {
  type = string
}

variable "vnet_cidr" {

}

variable "subnets" {
  description = "Subnet configuration"

  type = map(object({
    name = string
    cidr = string
  }))
}


variable "nsgs" {
  description = "NSG configurations"

  type = map(object({
    name = string

    rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "nsg_associations" {
  description = "Subnet to NSG association configuration"

  type = map(object({
    subnet_key = string
    nsg_key    = string
  }))
}