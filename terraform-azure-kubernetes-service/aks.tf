#
# Terraform Azure Kubernetes Service
#

# Resource Group
resource "azurerm_resource_group" "tf_aks" {
  name     = "${var.projectname}"
  location = "${var.location}"

  # tags = "${(var.resource_tags, map("Name", "${var.projectname}-${var.location}-aks-volume"))}"
}

# Azure File
# ToDo Create Condition if to be created or not.
module "azure-file" {
  source                            = "./terraform-azure-file-aks"
  projectname                       = "${var.projectname}"
  location                          = "${var.location}"
  resource_group_name               = "${azurerm_resource_group.tf_aks.name}"
  tf_aks_volume_sa_replication_type = "${var.tf_aks_volume_sa_replication_type}"
  tf_aks_volume_sa_tier             = "${var.tf_aks_volume_sa_tier}"
  tags                              = "${var.resource_tags}"
}

# Azure Kubernetes Service
# ToDos: Handling Secrets accordingly
resource "azurerm_kubernetes_cluster" "tf_aks" {
  name                = "${var.projectname}"
  location            = "${azurerm_resource_group.tf_aks.location}"
  resource_group_name = "${azurerm_resource_group.tf_aks.name}"
  kubernetes_version  = "${var.k8s_cluster_version}"
  dns_prefix          = "${var.dns_prefix}"

  linux_profile {
    admin_username = "${var.admin_username}"

    ssh_key {
      key_data = "${var.admin_rsa_pubkey}"
    }
  }

  agent_pool_profile {
    name    = "${var.projectname}"
    count   = "${var.k8s_node_count}"
    vm_size = "${var.k8s_node_size}"
    os_type = "Linux"
  }

  service_principal {
    client_id     = "${var.service_principal}"
    client_secret = "${var.service_principal_secret}"
  }

  tags = "${var.resource_tags}"
}
