@description('Location of the data factory.')
param location string = resourceGroup().location

@description('Name of the App storage account that contains the input/output data.')
param appStorageAccountName string = 'ktalkstorage${uniqueString(resourceGroup().id)}'

@description('Data Factory Name')
param dataFactoryName string = 'ktalk-adf-${uniqueString(resourceGroup().id)}'

resource sourceStorageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: appStorageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource dataFactoryName_resource 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
}
