
variable "name" {
  description = "NSG name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg-name" {
  description = "Resource group name"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "security_rules" {
  description = "List of NSG security rules"

  type = list(object({
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

  default = []
}

# 12