variable "resourcegroup" {
    type = string
    description = "name of the resource group to be created"
    default = "abb-resource-group"
}

variable "aks_resource_group" {
    type = string
    description = "name of the resource group to be created"
    default = "abb-aks-rg"
}

variable "appname" {
    type = string
    description = "name of the application for which the resources are created"
    default = "abb"
}

variable "tenantID" {
    type = string
    description = "tenant ID where the resources are to be deployed"
    default = "fe86ac0b-4280-44c1-861f-a5dd2142e65d"
}

variable "subscription_id" {
    type = string
    description = "subscription ID where the resources are to be deployed"
    default = "9a776e78-0232-45f5-9e14-b1f2f620c826"
}

variable "aks_subscription_id" {
    type = string
    description = "subscription ID where the resources are to be deployed"
    default = "8796fnbh78-0232-45f5-9e14-b1f2f620c826"
}
