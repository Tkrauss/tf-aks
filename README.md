# Terraform to provision Azure Kubernetes Services
TF-AKS aims to provide a stable provisioning of the Azure Kubernetes through Terraform.

The project has just started and is under heavy development.

[![pipeline status](https://gitlab.com/datadarius/tf-aks/badges/master/pipeline.svg)](https://gitlab.com/datadarius/tf-aks/commits/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/b881a797cb75808d006a/maintainability)](https://codeclimate.com/github/datadarius/tf-aks/maintainability)

## Planned Features
* Terraform Remote State on Azure File 
* Provisioning of a Azure Kubernetes Cluster
* A Persistent Storage Backend based on Azure File for Kubernetes Volumes.
* Secret Management where necessary.
* A static IP.
* inspec testing to verify resource creation.

## Usage

###  Requirements

* Terraform https://www.terraform.io 
* Azure Subscription https://azure.microsoft.com/
* Azure CLI installed and logged in. (az login) https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest
* kubectl installed https://kubernetes.io/docs/tasks/tools/install-kubectl/
* A Service Principal for your K8s Custer https://docs.microsoft.com/en-us/azure/container-service/kubernetes/container-service-kubernetes-service-principal


### Preparation

```
# Download TF-AKS
git clone git@gitlab.com:datadarius/tf-aks.git

# login to azure
az login

# get your subscription id
az account list

# create a service principal for your Cluster.
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/YOURSUBSCRIPTIONID

# Take notes of subscription ID, Service Principal ID (appId), Service Principal Secret (password), you will # need them in the next steps.

# Make sure you have your SSH Pubkey at hand.
```

### Bring up tf-aks
```
cd terraform-azure-kubernetes-service
terraform init

# Start in interactive mode:
terraform plan -out youraks.out

terraform apply youraks.out
```

You should now get a working Azure Kubernetes Cluster.

### Using tf-aks more automated
You can pass an automatic answerfile to terraform. However, be responsible with the secrets you have to manage.
It might e.g. make sense to not store Service Principal or other data in flat files. Have a look at the test.tf-test. You can also use terraform like:
terraform apply -var-file=test.tf-test -var 'service_principal=SECRETVALUE' -var 'service_principal_secret=SECRETVALUE'

## Production Deployments
### Using a Service Principal for Terraform
Pleaese consider using a dedicated SP for Terraform as explained by Hashicorp:
https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html

### Terraform Remote State (Recommended for Production use)
In case you are going for a production deployment, you will want to persist your state somewhere remote.
TF-AKS includes everything required to bootstrap a Azure File Container which then can be used as a Storage Backend for your Terraform State. As Terraform does not allow creating the backend within the same project it is going to be used, you will have to do this in sequence

## Useful Links

### ingress IP & Certbot certificate
* https://docs.microsoft.com/en-us/azure/aks/ingress

### Azure Rest API 
* https://docs.microsoft.com/en-us/rest/api/

### Persistent Volumes for Kubernetes through Azure File
* https://docs.microsoft.com/en-us/azure/aks/azure-files-dynamic-pv
* https://github.com/kubernetes/examples/blob/master/staging/volumes/azure_file/README.md


## Manual Instructions for az cli

```
# Creating a Resource Group
az group create -n your-k8s-tf-resources -l westeurope

# Creating an AKS Cluster which has 3 Nodes using k8s version 1.8.7 
az aks create -n your-k8s-cluster -g your-k8s-tf-resources -c 3 -k 1.8.7

# Download the kubeconfig
az aks get-credentials --name your-k8s-cluster --resource your-k8s-tf-resources

# Configuring your local kubectl to use the AKS Cluster
kubectl config use-context your-k8s-cluster

# See how many Nodes are running
kubectl get nodes


# Opening the Kubernetes Dashboard in Browser
az aks browse -n your-k8s-cluster -g your-k8s-tf-resources

```