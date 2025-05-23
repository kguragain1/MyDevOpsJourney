targetScope = 'resourceGroup'

param adminUsername string
@secure()
param adminPassword string
param virtualNetworkName string = 'CoreServicesVnet'
param subnetName string = 'PublicWebServiceSubnet'  // subnet for VMs
param location string = resourceGroup().location

var vmNames = [
  'TestVM1'
  'TestVM2'
]

resource vnet 'Microsoft.Network/virtualNetworks@2023-02-01' existing = {
  name: virtualNetworkName
}

resource publicIP 'Microsoft.Network/publicIPAddresses@2023-02-01' = [for vmName in vmNames: {
  name: '${vmName}-pip'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}]

resource nic 'Microsoft.Network/networkInterfaces@2023-02-01' = [for (vmName, i) in vmNames: {
  name: '${vmName}-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: '${vnet.id}/subnets/${subnetName}'
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIP[i].id
          }
        }
      }
    ]
  }
}]

resource vm 'Microsoft.Compute/virtualMachines@2023-03-01' = [for (vmName, i) in vmNames: {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
      windowsConfiguration: {
        enableAutomaticUpdates: true
      }
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2019-Datacenter'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic[i].id
        }
      ]
    }
  }
}]
