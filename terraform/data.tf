
# If you want to use this resource with data, then you will need to create it in Azure manually.
# Code below is commented so that there are less steps to do to run the code on your env.

# data "azurerm_user_assigned_identity" "uai" {
#   name                = "uai-terraform-${var.environment}-euw"
#   resource_group_name = "rg-terraform-infrastructure-${var.environment}-euw"
# }