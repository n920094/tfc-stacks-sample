locals {
  name = "${var.prefix}-db-${var.suffix}"
}

resource "azurerm_resource_group" "main" {
  name     = local.name
  location = var.location
}

module "mysql" {
  source  = "Azure/avm-res-dbformysql-flexibleserver/azurerm"
  version = "0.1.0"

  name                   = local.name
  location               = azurerm_resource_group.main.location
  resource_group_name    = azurerm_resource_group.main.name
  administrator_login    = "mradministrator"
  administrator_password = "P@ssw0rd12345!"
  sku_name               = "GP_Standard_D2ds_v4"
  mysql_version          = "8.0.21"
  zone                   = 2
  high_availability = {
    mode                      = "ZoneRedundant"
    standby_availability_zone = 3
  }
  tags = var.tags

}
