
variable "subnet-name" {
  description = "Subnet name"
  type        = string
}

variable "rg-name" {
  description = "Resource group name"
  type        = string
}

variable "vnet-name" {
  description = "Parent VNet name"
  type        = string
}

variable "address_prefixes" {
  description = "Subnet CIDR ranges"
  type        = list(string)
}