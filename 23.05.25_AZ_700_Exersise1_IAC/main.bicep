param resourceGroupName string = 'ContosoResourceGroup'

// Create Core VNet
module coreServices 'coreServicesVnet.bicep' = {
  name: 'coreServicesDeployment'
  params: {
    location: 'eastus'
    resourceGroupName: resourceGroupName
  }
}

// Create Manufacturing VNet
module manufacturing 'manufacturingVnet.bicep' = {
  name: 'manufacturingDeployment'
  params: {
    location: 'westeurope'
    resourceGroupName: resourceGroupName
  }
}

// Create Research VNet
module research 'researchVnet.bicep' = {
  name: 'researchDeployment'
  params: {
    location: 'southeastasia'
    resourceGroupName: resourceGroupName
  }
}
