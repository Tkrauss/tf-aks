output "storage-account-name" {
  value = "${azurerm_storage_account.tf_aks_volume_sa.name}"
}

output "storage_account_id" {
  value = "${azurerm_storage_account.tf_aks_volume_sa.id}"
}

output "container-name" {
  value = "${azurerm_storage_container.tf_aks_volume.name}"
}
