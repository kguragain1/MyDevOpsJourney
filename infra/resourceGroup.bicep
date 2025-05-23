param location string = 'eastus'
param resourceGroupName string = 'ContosoResourceGroup'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}
