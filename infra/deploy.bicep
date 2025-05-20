param location string
param resourceGroupName string
param storageAccountName string
targetScope = 'subscription'


module rg 'rg.bicep' = {
  name: 'createRG'
  scope: subscription()
  params: {
    location: location
    resourceGroupName: resourceGroupName
  }
}

module storage 'storage.bicep' = {
  name: 'createStorage'
  scope: resourceGroup(resourceGroupName)
  params: {
    storageAccountName: storageAccountName
  }
}
