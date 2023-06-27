locals {
  short_location  = module.azure_region.location_short
  resource_suffix = "${var.environment}-${local.short_location}"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-deploy-${local.resource_suffix}"
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = "safnterraform${var.environment}${local.short_location}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "asp" {
  name                = "asp-terraform-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  os_type  = "Linux"
  sku_name = "Y1" //Consumption plan (serverless)
}

resource "azurerm_linux_function_app" "fa" {
  name                = "fn-terraform-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  service_plan_id            = azurerm_service_plan.asp.id

  app_settings = {
    SecretConfig = var.secret_config
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [data.azurerm_user_assigned_identity.uai.id]
  }

  site_config {}
}

resource "azurerm_user_assigned_identity" "uai_conditional" {
  count               = var.deploy_uai ? 1 : 0

  name                = "uai-terraform-conditional-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}