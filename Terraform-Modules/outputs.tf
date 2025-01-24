output "abb_subnet_id" {
  value = module.az-vnet.subnet_id
}

output "abb_keyvault_id" {
  value = module.az-keyvault.keyvault_id
}

output "abb_acr_id" {
  value = module.az-acr.id
}

output "abb_aks_fqdn" {
  value = module.az-aks.abb_aks_fqdn
}

output "abb_aks_nodepools" {
  value = module.az-aks.abb_node_pool_ids
}