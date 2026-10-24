# ==========================================
# 1. RESOURCE GROUP OUTPUTS
# ==========================================

output "resource_group_details" {
  value = {
    name     = module.rg.rg_name
    location = module.rg.location
    id       = module.rg.rg_id
  }
}


# ==========================================
# 2. VNET OUTPUTS
# ==========================================

output "vnet_details" {
  value = {
    name          = module.vnet.name
    id            = module.vnet.id
    address_space = module.vnet.address_space
  }
}


# ==========================================
# 3. SUBNET OUTPUTS
# ==========================================

output "subnet_details" {
  value = {
    for key, subnet in module.subnet : key => {
      name             = subnet.name
      id               = subnet.id
      address_prefixes = subnet.address_prefixes
    }
  }
}


# ==========================================
# 4. NSG OUTPUTS
# ==========================================

output "nsg_details" {
  value = {
    for key, nsg in module.nsg : key => {
      name = nsg.name
      id   = nsg.id
    }
  }
}


# ==========================================
# 5. NSG ASSOCIATION OUTPUTS
# ==========================================

# output "nsg_association_details" {
#   value = {
#     for key, association in module.subnet_nsg_association : key => {
#       id = association.id
#     }
#   }
# }