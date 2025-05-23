targetScope = 'resourceGroup'

param dnsZoneName string = 'contoso.com'
param virtualNetworkId string

resource dnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' existing = {
  name: dnsZoneName
}

resource virtualNetworkLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  name: 'CoreServicesVnetLink'
  parent: dnsZone
  properties: {
    virtualNetwork: {
      id: virtualNetworkId
    }
    registrationEnabled: true
  }
}
