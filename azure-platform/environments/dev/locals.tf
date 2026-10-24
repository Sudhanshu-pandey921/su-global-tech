locals {
  prefix = "platform-${var.environment}"

  common_tags = {
    project     = "AZ-INFRA-024"
    environment = var.environment
    managed_by  = "Sudhanshu"
  }
}