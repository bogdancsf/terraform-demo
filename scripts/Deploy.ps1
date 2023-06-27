.\SetEnvironmentAndAuth.ps1 $args[0]

# INIT
Write-Output "`n TERRAFORM INIT `n"

terraform init `
    -reconfigure `
    -backend-config="storage_account_name=$STORAGE_ACCOUNT" `
    -backend-config="container_name=$STORAGE_ACCOUNT_CONTAINER" `
    -backend-config="key=$STORAGE_ACCOUNT_BLOB_KEY" `
    -backend-config="sas_token=$STORAGE_ACCOUNT_TOKEN"

# PLAN
Write-Output "`n TERRAFORM PLAN `n"

terraform plan `
    -var-file="environments/${ENVIRONMENT}.tfvars" `
    -out deploy.plan

# APPLY
Write-Output "`n TERRAFORM APPLY `n"

terraform apply deploy.plan

# CLEAN UP
Remove-Item deploy.plan

cd ../scripts
Write-Output "`n DEPLOY COMPLETED `n"
