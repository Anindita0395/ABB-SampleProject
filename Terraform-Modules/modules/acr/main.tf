resource "azurerm_container_registry" "az-acr" {
  name                        = "${var.appname}-acr"
  location                    = "southeastaisa"
  resource_group_name         = var.resourcegroup
  sku                         = "Premium"
}


