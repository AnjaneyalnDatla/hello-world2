@description('Specifies region of all resources')
param location string = resourceGroup().location

@description('A static web app to host My Account Single Page Application')
resource staticWebApp 'Microsoft.Web/staticSites@2021-03-01' = {
  name: 'stapp-test-lock'
  location: 'eastus2'
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
  properties: {
    buildProperties: {
      skipGithubActionWorkflowGeneration: true
    }
    provider: 'DevOps'
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'app-test-lock'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Request_Source: 'rest'
  }
}
