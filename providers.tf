# Please do NOT set these credentials here.
provider "azurerm" {
}

/*
Please maintain the credentials outside your git repository e.g. through environment variables.
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
*/


# Resource Group
resource "azurerm_resource_group" "development" {
  name     = "${var.projectname}-dev"
  location = "West Europe"
}

provider "kubernetes" {
}
