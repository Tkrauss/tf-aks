# Terraform to provision Azure Kubernetes Services
TF-AKS aims to provide a stable provisioning of the Azure Kubernetes through Terraform.

The project has just started and is under heavy development.

[![pipeline status](https://gitlab.com/datadarius/tf-aks/badges/master/pipeline.svg)](https://gitlab.com/datadarius/tf-aks/commits/master)
[![Test Coverage](https://api.codeclimate.com/v1/badges/b881a797cb75808d006a/test_coverage)](https://codeclimate.com/github/datadarius/tf-aks/test_coverage)

## Planned Features
* Terraform Remote State on Azure File 
* Provisioning of a Azure Kubernetes Cluster including
* A Persistent Storage Backend based on Azure File
* Secret Management where necessary
* A static IP
* inspec testing to verify resource creation


## General Requirements

* Terraform https://www.terraform.io 
* Azure Subscription https://azure.microsoft.com/
* Azure CLI installed and logged in. (az login) https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest
* kubectl installed https://kubernetes.io/docs/tasks/tools/install-kubectl/

# Usage

### Required Variables
```
location
projectname
```

### Security: Please use a Service Principal
TODO
* https://docs.microsoft.com/en-us/azure/container-service/kubernetes/container-service-kubernetes-service-principal
* https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html


## Useful Links

### ingress IP & Certbot certificate
* https://docs.microsoft.com/en-us/azure/aks/ingress

### Azure Rest API 
* https://docs.microsoft.com/en-us/rest/api/

### Persistent Volumes for Kubernetes through Azure File
* https://docs.microsoft.com/en-us/azure/aks/azure-files-dynamic-pv
* https://github.com/kubernetes/examples/blob/master/staging/volumes/azure_file/README.md


### Manual Instructions for az aks

```
Creating a Resource Group
az group create -n your-k8s-tf-resources -l westeurope

Creating an AKS Cluster
az aks create -n your-k8s-cluster -g your-k8s-tf-resources -c 3 -k 1.8.7

Downloading the kubeconfig
az aks get-credentials --name your-k8s-cluster --resource your-k8s-tf-resources

Opening the Kubernetes Dashboard in Browser
az aks browse -n your-k8s-cluster -g your-k8s-tf-resources

Configuring your local kubectl to use the AKS Cluster
kubectl config use-context your-k8s-cluster

See how many Nodes are running
kubectl get nodes
```



