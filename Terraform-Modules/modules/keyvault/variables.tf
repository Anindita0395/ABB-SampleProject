variable "resourcegroup" {
    type = string
    description = "name of the resource group to be created"
}

variable "appname" {
    type = string
    description = "name of the application for which the resources are created"
}

variable "tenantID" {
    type = string
    description = "tenant ID where the resources are to be deployed"
}