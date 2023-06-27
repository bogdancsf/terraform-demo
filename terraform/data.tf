data "azurerm_user_assigned_identity" "uai" {
  name                = "uai-terraform-${var.environment}-euw"
  resource_group_name = "rg-terraform-infrastructure-${var.environment}-euw"
}