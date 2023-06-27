# terraform-demo
Terraform code and Powershell scripts to deploy some resources to Azure.

To be able to run this, besides installing tools like Azure CLI and Terraform, you will need your own Azure environment, as well as an Azure Storage Account with a Blob Container where the terraform state will be saved.

After that, you should be able to just change the variables in the 'SetEnvironmentAndAuth.ps1' script to match the Storage Account name and the Container name, and then run either 'Deploy.ps1' or 'RefactoredDeploy.ps1' script (both do the same thing) to deploying resources to Azure, or run 'Destroy.ps1' script to destroy all Azure resources deployed using the terraform code.

When running any of those scripts, also send the environment parameter, which should be either 'dev' or 'test', as is reflected by the name of the variable files defined in the '/environments' folder. This will allow you to deploy either to 'dev' or 'test' environment. But make sure that for each environment you have a Storage Account and Container, cause a deployment to 'dev' should save the state in a different Storage Account than a deployment to 'test'. 

Also make sure you login to the correct account/subscription when the 'az login' command runs in the 'SetEnvironmentAndAuth.ps1' script, so that terraform has the rights to deploy to your Azure environment when the terraform CLI commands are run, and so that the script is able to generate the SAS token required to access the Storage Account.
