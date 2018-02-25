variable "projectname"  {
description = "set the name of the project"
type = "string"
}

variable "location"  {
description = "set Azure Location e.g. eastus or westeurope"
type = "string"
}

variable "tf_aks_state_sa_replication_type"  {
description = "set replication type for the Storage Account"
type = "string"
default = "LRS"
}

variable "prevent_destroy" {
    description = "Will prevent deletion of resources through TF destroy."
    default = "true"
}

variable "tf_aks_state_sa_tier"  {
description = "Set the Storage Tier e.g. to Standard or Premium"
type = "string"
default = "Standard"
}


variable "resource_tags" {
type = "map"
default = {
    Name = "aks_state"
    }
}