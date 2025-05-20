// deploy.bicep
targetScope = 'subscription'

param location string
param resourceGroupName string
param storageAccountName string

// Create the resource group at the subscription level
resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

// Deploy the storage account module *into* the newly created RG
module storageModule 'storage.bicep' = {
  name: 'deployStorage'
  scope: resourceGroup(rg.name)
  params: {
    location: location
    storageAccountName: storageAccountName
  }
}
