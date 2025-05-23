targetScope = 'resourceGroup'

param resourceGroupName string
param dnsZoneName string = 'contoso.com'

resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: dnsZoneName
  location: 'global'  // Private DNS zones are global resources
}
