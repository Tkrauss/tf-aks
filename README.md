# Terraform to provision Azure Kubernetes Services


# Preparation
install latest az



https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest

➜ az group create -n darius-k8s-westeurope -l westeurope
➜ az aks create -n darius-k8s -g darius-k8s-eastus -c 3 -k 1.8.7

persistent volume anlegen
https://docs.microsoft.com/de-de/azure/aks/azure-files-dynamic-pv


## Configuring a Service Principal
https://docs.microsoft.com/en-us/azure/container-service/kubernetes/container-service-kubernetes-service-principal
https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html

# Usage

## Secret Management

# Related Information
https://docs.microsoft.com/en-us/rest/api/
https://github.com/terraform-providers/terraform-provider-azurerm
