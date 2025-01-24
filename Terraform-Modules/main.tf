module "az-vnet" {
    source = "./modules/vnet"
    resourcegroup = var.resourcegroup
    appname = var.appname
}

module "az-keyvault" {
    source = "./modules/keyvault"
    appname = var.appname
    resourcegroup = var.resourcegroup
    tenantID = var.tenantID
}

module "az-acr" {
    # providers = {
    #   azurerm.abb-subscription = azurerm.abb-subscription
    # }
    source = "./modules/acr"
    appname = var.appname
    resourcegroup = var.resourcegroup    
}

module "az-aks" {
    providers = {
        azurerm.akssubscriptionid = azurerm.akssubscriptionid
    }
    source = "./modules/aks"
    resourcegroup =  var.aks_resource_group 
    appname = var.appname 
}