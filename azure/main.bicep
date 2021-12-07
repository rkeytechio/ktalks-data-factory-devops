@description('Location of the data factory.')
param location string = resourceGroup().location

@description('Name of the App storage account that contains the input/output data.')
param appStorageAccountName string = 'appstg${uniqueString(resourceGroup().id)}'

@description('Name of the Azure storage account that contains the input/output data.')
param functionAppStorageAccountName string = 'fastg${uniqueString(resourceGroup().id)}'

resource sourceStorageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: appStorageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource targetStorageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: functionAppStorageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
