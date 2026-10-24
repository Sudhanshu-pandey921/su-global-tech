# ==========================================
# 1. AZURE CONFIGURATION
# ==========================================

location    = "Central India"
environment = "dev"









# ==========================================
# 2. VNET CONFIGURATION
# ==========================================

vnet_name = "vnet-platform-dev-ci"
vnet_cidr = "10.10.0.0/16"


# ==========================================
# 3. SUBNET CONFIGURATION
# ==========================================

subnets = {
  app = {
    name = "snet-dev-app"
    cidr = "10.10.1.0/24"
  }

  data = {
    name = "snet-dev-data"
    cidr = "10.10.2.0/24"
  }
}


# ==========================================
# 4. NSG CONFIGURATION
# ==========================================

nsgs = {
  app = {
    name = "nsg-dev-app"

    rules = [
      {
        name                       = "Allow-HTTPS"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }

  data = {
    name = "nsg-dev-data"

    rules = [
      {
        name                       = "Allow-SQL-From-App"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "10.10.1.0/24"
        destination_address_prefix = "*"
      }
    ]
  }
}


# ==========================================
# 5. NSG ASSOCIATION CONFIGURATION
# ==========================================

nsg_associations = {
  app = {
    subnet_key = "app"
    nsg_key    = "app"
  }

  data = {
    subnet_key = "data"
    nsg_key    = "data"
  }
}