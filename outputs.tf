output "aks_id" {
  value = azurerm_kubernetes_cluster.aksacr.id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aksacr.fqdn
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.aksacr.node_resource_group
}