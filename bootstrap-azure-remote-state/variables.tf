variable "projectname" {
  description = "set the name of the project"
  type        = "string"
}

variable "location" {
  description = "set Azure Location e.g. eastus or westeurope"
  type        = "string"
}

variable "use_ressource_group" {
  description = "Defines the ressurce group to use. If not set explicitly, a new one will be created"
  default     = "-"
}

variable "tf_aks_state_sa_replication_type" {
  description = "set replication type for the Storage Account"
  type        = "string"
  default     = "ZRS"
}

variable "prevent_destroy" {
  description = "Will prevent deletion of resources through TF destroy."
  type        = "string"
  default     = true
}

variable "tf_aks_state_sa_tier" {
  description = "Set the Storage Tier e.g. to Standard or Premium"
  type        = "string"
  default     = "Standard"
}
