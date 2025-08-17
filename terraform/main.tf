terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformDemo"
    storage_account_name = "cdlterraformcodeops"
    container_name       = "tfstatefile"
    key                  = "dev.terraform.tfstate"
  }
}

# module "RG" {
#   source   = "./modules/RG" #A
#   rgname   = var.rgname     #B
#   location = var.location
# }
# module "SA" {
#   source   = "./modules/StorageAccount"
#   sname    = var.sname
#   rgname   = var.rgname
#   location = var.location
# }


resource "azurerm_resource_group" "cdl_tf_hos_eus" {
  name     = "rg-cdl-tf-hos-eus"
  location = "East US"
}