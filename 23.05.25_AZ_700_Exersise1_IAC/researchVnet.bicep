param location string = 'southeastasia'
param resourceGroupName string

resource researchVnet 'Microsoft.Network/virtualNetworks@2023-02-01' = {
  name: 'ResearchVnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.40.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'ResearchSystemSubnet'
        properties: {
          addressPrefix: '10.40.0.0/24'
        }
      }
    ]
  }
}
