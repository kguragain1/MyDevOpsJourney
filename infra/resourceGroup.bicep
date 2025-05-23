targetScope = 'subscription'

param location string = 'eastus'
param resourceGroupName string = 'ContosoResourceGroup'


resource rg 'Microsoft.Resources/resourceGroups@2023-01-01' = {
  name: resourceGroupName
  location: location
}

