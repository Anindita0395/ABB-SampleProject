resource "azurerm_virtual_network" "az-vnet" {
  name                = "${var.appname}-vnet"
  location            = "southeastaisa"
  resource_group_name = var.resourcegroup
  address_space       = ["10.0.0.0/16"]

}

resource "azurerm_subnet" "az-subnet" {
  name                 = "${var.appname}-subnet"
  resource_group_name  = var.resourcegroup
  virtual_network_name = azurerm_virtual_network.az-vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}


