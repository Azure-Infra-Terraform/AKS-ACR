resource "azurerm_resource_group" "terraform_aks_acr_rg" {
  name     = var.terraform_aks_acr_rg_name
  location = var.terraform_aks_acr_rg_location
}

resource "azurerm_container_registry" "acr" {
  name                = var.terraform_acr_name
  resource_group_name = azurerm_resource_group.terraform_aks_acr_rg.name
  location            = azurerm_resource_group.terraform_aks_acr_rg.location
  sku                 = var.terraform_acr_sku
}

resource "azurerm_role_assignment" "example" {
  principal_id                     = azurerm_kubernetes_cluster.aksacr.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}

resource "azurerm_kubernetes_cluster" "aksacr" {
  name                = var.terraform_aks_acr_name
  location            = azurerm_resource_group.terraform_aks_acr_rg.location
  resource_group_name = azurerm_resource_group.terraform_aks_acr_rg.name
  dns_prefix          = var.terraform_aks_acr_dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.terraform_aks_acr_node_size
  }

  identity {
    type = "SystemAssigned"
  }
}