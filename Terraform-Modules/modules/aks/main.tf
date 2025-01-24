resource "random_string" "random" {
    length = 5
    upper = false
    special = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = format("%s-aks",var.appname)
  location            = "southeastasia"
  resource_group_name = var.resourcegroup
  dns_prefix          = format("%s-%s",var.appname, random_string.random.id)
  kubernetes_version  = "1.27.9"


    default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
    auto_scaling_enabled = "true"
    min_count = 2
    max_count = 5
    }

    workload_autoscaler_profile {
        keda_enabled = "true"
    }
    
    network_profile {
        network_plugin = "overlay"
    }

    identity {
    type = "SystemAssigned"
    }


    azure_active_directory_role_based_access_control {
    azure_rbac_enabled = "true"
    admin_group_object_ids = "<admin group id for aks>"
    }
}

resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pools" {
  count               = 2  # Creating two node pools
  name                = format("%s-nodepool-%s",var.appname,count.index + 1)
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size             = each.value.vm_size
  node_count          = each.value.node_count
  auto_scaling_enabled = "true"
  min_count           = 2
  max_count           = 5
  
  # Nodelabels
  node_labels = {
    for k, v in local.nodepool_labels[tostring(count.index)] :
    k => v
  }

}

terraform {
  required_providers {
    azurerm = {
        configuration_aliases = [ azurerm.akssubscriptionid ]
    }
  }
}