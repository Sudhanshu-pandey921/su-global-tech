module "rg" {
  source   = "../../modules/resource-group"
  rg-name  = "rg-platform-${var.environment}-ci"
  location = var.location
  tags     = local.common_tags
}

module "vnet" {
  source = "../../modules/vnet"

  vnet-name     = var.vnet_name
  address_space = [var.vnet_cidr]
  location      = module.rg.location
  rg-name       = module.rg.rg_name
  tags          = local.common_tags

  depends_on = [module.rg]
}

module "subnet" {
  source   = "../../modules/subnet"
  for_each = var.subnets

  subnet-name      = each.value.name
  rg-name          = module.rg.rg_name
  vnet-name        = module.vnet.name
  address_prefixes = [each.value.cidr]

  depends_on = [module.vnet]
}

module "nsg" {
  source   = "../../modules/nsg"
  for_each = var.nsgs

  name           = each.value.name
  location       = var.location
  rg-name        = module.rg.rg_name
  security_rules = each.value.rules

  tags = local.common_tags

  depends_on = [module.subnet]
}

module "nsg-association" {
  source   = "../../modules/subnet-association"
  for_each = var.nsg_associations

  subnet_id                 = module.subnet[each.value.subnet_key].id
  network_security_group_id = module.nsg[each.value.nsg_key].id

  depends_on = [module.nsg]

}

