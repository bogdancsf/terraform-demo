param([string]$ENVIRONMENT_INPUT)

if ($ENVIRONMENT_INPUT) {
    $global:ENVIRONMENT = $ENVIRONMENT_INPUT
}
else {
    $global:ENVIRONMENT = Read-Host -Prompt 'Input the environment'
}

az login

$global:STORAGE_ACCOUNT           = "satfstate${ENVIRONMENT}euw"
$global:STORAGE_ACCOUNT_CONTAINER = "tfstate"
$global:STORAGE_ACCOUNT_BLOB_KEY  = "tfstate"
$global:STORAGE_ACCOUNT_TOKEN     = az storage container generate-sas `
                                        --account-name $STORAGE_ACCOUNT `
                                        --name $STORAGE_ACCOUNT_CONTAINER `
                                        --permissions rlw `
                                        --expiry (Get-Date).AddMinutes(10).ToString("yyyy-MM-dTH:mZ")

cd ../terraform