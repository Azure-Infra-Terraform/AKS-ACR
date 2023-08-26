terraform {
    backend "azurerm" {
    resource_group_name   = "TerraformAKSACR"   # Replace with your resource group name
    storage_account_name  = "terraformaksacrprovision" # Replace with your storage account name
    container_name        = "terraformaksacrcont"      # Replace with the container name
    key                   = "statekey"
  } 
}
