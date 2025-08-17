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

# resource "azurerm_storage_account" "cdl_tf_hos_eus" {
#   name                     = "sacdltfhoseus"
#   resource_group_name      = azurerm_resource_group.cdl_tf_hos_eus.name
#   location                 = azurerm_resource_group.cdl_tf_hos_eus.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     ringValue                  = "r0"
#     skip-CloudGov-StoragAcc-SS = "true"
#   }

#   depends_on = [
#     azurerm_resource_group.cdl_tf_hos_eus
#   ]
# }