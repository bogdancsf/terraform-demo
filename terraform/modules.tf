module "azure_region" {
  source       = "claranet/regions/azurerm"
  version      = "4.2.1"
  azure_region = var.location
}