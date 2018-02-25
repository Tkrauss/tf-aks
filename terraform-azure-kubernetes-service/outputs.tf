output "resource-group-name" {
  value = "${azurerm_resource_group.tf_aks.name}"
}

output "aks-cluster-id" {
  value = "${azurerm_kubernetes_cluster.tf_aks.id}"
}

output "aks-cluster-fqdn" {
  value = "${azurerm_kubernetes_cluster.tf_aks.fqdn}"
}

output "aks-cluster-name" {
  value = "${azurerm_kubernetes_cluster.tf_aks.name}"
}

output "aks-cluster-location" {
  value = "${azurerm_kubernetes_cluster.tf_aks.location}"
}