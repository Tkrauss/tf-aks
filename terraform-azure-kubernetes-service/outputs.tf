output "resource-group-name" {
  value = "${azurerm_resource_group.tf_aks_state.name}"
}

output "storage-account-name" {
  value = "${azurerm_storage_account.tf_aks_state_sa.name}"
}

output "storage_account_id" {
  value = "${azurerm_storage_account.tf_aks_state_sa.id}"
}

output "container-name" {
  value = "${azurerm_storage_container.tf_aks_state.name}"
}

