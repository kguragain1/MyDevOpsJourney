param location string
param storageAccountName string
param resourceGroupName string

resource rg 'Microsoft.Resources/resourceGroups@2023-01-01' existing = {
  name: resourceGroupName
  location: location
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'mystorageaccount'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {}
}
