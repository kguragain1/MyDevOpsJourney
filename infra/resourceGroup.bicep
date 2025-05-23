targetScope = 'subscription'

param location string = 'eastus'
param resourceGroupName string = 'ContosoResourceGroup'


resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

