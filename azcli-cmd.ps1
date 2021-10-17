#Logon to azure account
az login 

# if you have multiple subscriptions then select the one you want to use

# create environment variables to initialise a shared back end (azure storage account)

$env:RESOURCE_GROUP_NAME = 'elijah-state'
$env:STORAGE_ACCOUNT_NAME = 'elijahtfstate'
$env:CONTAINER_NAME = 'tstate'

# Create Resource Group
az group create --name $env:RESOURCE_GROUP_NAME --location uksouth

# Create Storage Account
az storage account create --resource-group $env:RESOURCE_GROUP_NAME --name $env:STORAGE_ACCOUNT_NAME --sku Standard_GRS --encryption-services blob

# Get storage account key
$env:ACCOUNT_KEY = (az storage account keys list --resource-group $env:RESOURCE_GROUP_NAME --account-name $env:STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

# Create a blob container
az storage container create --name $env:CONTAINER_NAME --account-name $env:STORAGE_ACCOUNT_NAME --account-key $env:ACCOUNT_KEY

