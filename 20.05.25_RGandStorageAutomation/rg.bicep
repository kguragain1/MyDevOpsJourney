targetScope = 'subscription'

param location string
param resourceGroupName string

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}
