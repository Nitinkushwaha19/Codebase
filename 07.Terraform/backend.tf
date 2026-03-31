terraform {
  backend "azurerm" {
    resource_group_name  = "000.Terraform-State"
    storage_account_name = "terraformrishi"
    container_name       = "nitin"
    key                  = "terraform.tfstate"
    access_key           = ""
  }
}
