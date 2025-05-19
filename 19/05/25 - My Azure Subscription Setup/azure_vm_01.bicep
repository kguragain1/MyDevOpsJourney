resource azureVm 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: 'myVM'
  location: resourceGroup().location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_DS1_v2'
    }
    osProfile: {
      computerName: 'myVM'
      adminUsername: 'azureuser'
      adminPassword: 'P@ssw0rd1234!'
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: azureNetworkInterface.id
        }
      ]
    }
  }
}
resource azureNetworkInterface 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: 'myNetworkInterface'
  location: resourceGroup().location
  properties: {
    ipConfigurations: [
      {
        name: 'myIPConfig'
        properties: {
          subnet: {
            id: azureSubnet.id
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
}
resource azureSubnet 'Microsoft.Network/virtualNetworks/subnets@2022-05-01' = {
  name: 'mySubnet'
  parent: azureVirtualNetwork
  properties: {
    addressPrefix: 'ashmita'
  }
}
resource azureVirtualNetwork 'Microsoft.Network/virtualNetworks@2022-05-01' = {
  name: 'myVNet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        'ashmita' // Replace with your actual address space CIDR block
      ]
    }
    subnets: [
      {
        name: 'mySubnet'
        properties: {
          addressPrefix: 'ashmita' // Replace with your actual subnet CIDR block
        }
      }
    ]
  }
}
output vmId string = azureVm.id
output vmName string = azureVm.name
output vmLocation string = azureVm.location
output vmSize string = azureVm.properties.hardwareProfile.vmSize
output vmAdminUsername string = azureVm.properties.osProfile.adminUsername
output vmAdminPassword string = azureVm.properties.osProfile.adminPassword
output vmImagePublisher string = azureVm.properties.storageProfile.imageReference.publisher
output vmImageOffer string = azureVm.properties.storageProfile.imageReference.offer
output vmImageSku string = azureVm.properties.storageProfile.imageReference.sku
output vmImageVersion string = azureVm.properties.storageProfile.imageReference.version
output vmNetworkInterfaceId string = azureNetworkInterface.id
output vmNetworkInterfaceName string = azureNetworkInterface.name
output vmNetworkInterfaceLocation string = azureNetworkInterface.location
output vmNetworkInterfacePrivateIPAllocationMethod string = azureNetworkInterface.properties.ipConfigurations[0].properties.privateIPAllocationMethod
output vmNetworkInterfaceSubnetId string = azureNetworkInterface.properties.ipConfigurations[0].properties.subnet.id
output vmNetworkInterfaceSubnetName string = azureNetworkInterface.properties.ipConfigurations[0].properties.subnet.name
output vmNetworkInterfaceSubnetAddressPrefix string = azureNetworkInterface.properties.ipConfigurations[0].properties.subnet.properties.addressPrefix
output vmNetworkInterfaceVirtualNetworkId string = azureVirtualNetwork.id
output vmNetworkInterfaceVirtualNetworkName string = azureVirtualNetwork.name
output vmNetworkInterfaceVirtualNetworkLocation string = azureVirtualNetwork.location
output vmNetworkInterfaceVirtualNetworkAddressSpace string = azureVirtualNetwork.properties.addressSpace.addressPrefixes[0]
output vmNetworkInterfaceVirtualNetworkSubnets string = azureVirtualNetwork.properties.subnets[0].name
output vmNetworkInterfaceVirtualNetworkSubnetsAddressPrefix string = azureVirtualNetwork.properties.subnets[0].properties.addressPrefix
