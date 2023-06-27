.\SetEnvironmentAndAuth.ps1 $args[0]

# INIT
Write-Output "`n TERRAFORM INIT `n"

terraform init `
    -reconfigure `
    -backend-config="storage_account_name=$STORAGE_ACCOUNT" `
    -backend-config="container_name=$STORAGE_ACCOUNT_CONTAINER" `
    -backend-config="key=$STORAGE_ACCOUNT_BLOB_KEY" `
    -backend-config="sas_token=$STORAGE_ACCOUNT_TOKEN"

# DESTROY
Write-Output "`n TERRAFORM DESTROY `n"

terraform destroy  `
    -var-file="environments/${ENVIRONMENT}.tfvars"


cd ../scripts
Write-Output "`n DESTROY COMPLETED `n"
