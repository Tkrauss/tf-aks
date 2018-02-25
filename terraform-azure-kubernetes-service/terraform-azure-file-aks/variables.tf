variable "projectname"  {
description = "set the name of the project"
type = "string"
}

variable "location"  {
description = "set Azure Location e.g. eastus or westeurope"
type = "string"
}

variable "tf_aks_sa_replication_type"  {
description = "set replication type for the Storage Account"
type = "string"
default = "LRS"
}

variable "tf_aks_sa_tier"  {
description = "Set the Storage Tier e.g. to Standard or Premium"
type = "string"
}


variable "resource_tags" {
type = "map"
default = {
    Name = "tf-aks"
    }
}