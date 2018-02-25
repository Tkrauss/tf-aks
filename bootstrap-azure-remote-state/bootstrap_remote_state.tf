#
# Terraform Remote State for AzureRM
# Used to store the state of the deployment in a remote storage container.
# It is not possible to have Terraform provision its remote state and then perform the actual provisioning.
# Therefore you need to run this manually in the first step, in case you intend to store the Terraform State remote.

provider "azurerm" {
}

# Resource Group
# Required for the Storage Resources
resource "azurerm_resource_group" "tf_aks_state" {
  name     = "${var.projectname}-${var.location}-tfstate"
  location = "${var.location}"

 # tags = "${(var.resource_tags, map("Name", "${var.projectname}-${var.location}-tfstate"))}"
}

# Generates a Random ID to be used for the SA name.
resource "random_id" "tf_aks_state_sa_random" {
  byte_length = 6
  keepers {
    sa_account_ref = 1
  }
}

# Storage Account in which the Storage Container will be created in.
resource "azurerm_storage_account" "tf_aks_state_sa" {
  name                     = "${random_id.tf_aks_state_sa_random.hex}"
  location                 = "${var.location}"
  resource_group_name      = "${azurerm_resource_group.tf_aks_state.name}"
  account_replication_type = "${var.tf_aks_state_sa_replication_type}"
  account_tier             = "${var.tf_aks_state_sa_tier}"
  enable_file_encryption   = "true" 
  enable_https_traffic_only = "true"
  account_encryption_source = "Microsoft.Storage"

  lifecycle {
    prevent_destroy = false
  }

  #  tags = "${(var.resource_tags, map("Name", "${var.projectname}-${var.location}-tfstate"))}"

}

# Creation of the storage Container
resource "azurerm_storage_container" "tf_aks_state" {
  name                 = "${var.projectname}-tf-state"
  resource_group_name  = "${azurerm_resource_group.tf_aks_state.name}"
  storage_account_name = "${azurerm_storage_account.tf_aks_state_sa.name}"
  container_access_type = "private"
  lifecycle {
    prevent_destroy = false
  }

  #  tags = "${(var.resource_tags, map("Name", "${var.projectname}-${var.location}-tfstate"))}"
}

