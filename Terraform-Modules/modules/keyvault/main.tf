resource "azurerm_key_vault" "az-keyvault" {
  name                        = "${var.appname}-keyvault"
  location                    = "southeastaisa"
  resource_group_name         = var.resourcegroup
  tenant_id                   = var.tenantID
  sku_name                    = "standard"

  # for myself
  access_policy {
    tenant_id = var.tenantID
    object_id = "01a07da7-edc1-4f0b-84bb-c80df71c240d"  # Replace with your Azure AD user object ID

    secret_permissions = ["Get", "Set", "List", "Delete"]
    key_permissions    = ["Get", "Create", "List", "Delete"]
    certificate_permissions = ["Get", "List", "Delete"]
  }
  # for service principle azure-devops-spn
  access_policy {
    tenant_id = var.tenantID
    object_id = "fdb0ec9b-765d-43f3-83f2-4641cc1265de"  # Replace with your service principal's object ID

    secret_permissions = ["Get", "Set", "List", "Delete"]
    key_permissions    = ["Get", "Create", "List", "Delete"]
    certificate_permissions = ["Get", "List", "Delete"]
  }
}

