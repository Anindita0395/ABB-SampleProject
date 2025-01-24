output "abb_aks_fqdn" {
  description = "The FQDN of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.fqdn
}
output "abb_node_pool_ids" {
  description = "The IDs of the node pools in the AKS cluster"
  value       = [for nodepool in azurerm_kubernetes_cluster_node_pool.aks_node_pools : nodepool.id]
}

