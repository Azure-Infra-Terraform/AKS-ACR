variable "terraform_aks_acr_rg_name" {
    type = string
    description = "Name of the resource group"
}

variable "terraform_acr_name" {
  type = string
  description = "Name of the ACR"
}

variable "terraform_acr_sku" {
  type = string
  description = "SKU of ACR"
}

variable "terraform_aks_acr_rg_location" {
  type = string
  description = "Location of the resource group"
}

variable "terraform_aks_acr_name" {
  type = string
  description = "Name of AKS cluster"
}

variable "terraform_aks_acr_dns_prefix" {
  type = string
  description = "DNS of AKS"
}

variable "terraform_aks_acr_node_size" {
  type = string
  description = "Size of each node in AKS cluster"
}