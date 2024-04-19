
param name string = 'gab-app-service-plan'
param webSiteName string = 'gab-auckland-app'
param linuxFxVersion string = 'DOTNETCORE|8.0'
param location string = resourceGroup().location
param sku string = 'F1'


resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: name
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'linux'
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}
