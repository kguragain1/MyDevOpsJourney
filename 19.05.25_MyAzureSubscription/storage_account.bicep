param storageAccountName string
param resourceGroupName string

resource rg 'Microsoft.Resources/resourceGroups@2023-01-01' existing = {
  name: resourceGroupName
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {}
}
