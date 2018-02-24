# Terraform to provision Azure Kubernetes Services
TF-AKS aims to provide a stable provisioning of the Azure Kubernetes through Terraform.
The project has just started and is under heavy development.

[![pipeline status](https://gitlab.com/datadarius/tf-aks/badges/master/pipeline.svg)](https://gitlab.com/datadarius/tf-aks/commits/master)

# Planned Features
## Terraform Remote State on Azure File 
## Provisioning of a Azure Kubernetes Cluster including
## A Persistent Storage Backend based on Azure File
## Azure
## A static IP and DNS Namespace assigned

# General Requirements

* Terraform https://www.terraform.io 
* Azure Subscription https://azure.microsoft.com/
* Azure CLI installed and logged in. (az login) https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest

# Usage

# Security: Please use a Service Principal
Why?
https://docs.microsoft.com/en-us/azure/container-service/kubernetes/container-service-kubernetes-service-principal
https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html

# Persistent Volumes for Kubernetes through Azure File
https://docs.microsoft.com/en-us/azure/aks/azure-files-dynamic-pv
https://github.com/kubernetes/examples/blob/master/staging/volumes/azure_file/README.md

# Useful Links

## ingress IP & Certbot certificate
https://docs.microsoft.com/en-us/azure/aks/ingress

## Azure Rest API 
https://docs.microsoft.com/en-us/rest/api/

## Secret Management
ToDo

# Manual Instructions for az aks
➜ az group create -n darius-k8s-westeurope -l westeurope
➜ az aks create -n darius-k8s -g darius-k8s-eastus -c 3 -k 1.8.7