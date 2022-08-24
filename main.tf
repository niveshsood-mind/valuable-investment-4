resource "azurerm_resource_group" "ResourceGroup" {    
  name = "Test-RG-2"    
  location = "eastus"    
}  
resource "azurerm_app_service_plan" "AppServicePlanName" {  
  name                = "Test-APP-Service-Plan"  
  location            = "eastus"  
  resource_group_name = azurerm_resource_group.ResourceGroup.name  
  
  sku {  
    tier = "Standard"  
    size = "S1"  
  }  
}   
resource "azurerm_app_service" "WebAppName" {  
  name                = "Test-Web-App-Name"  
  location            = "eastus"  
  resource_group_name = azurerm_resource_group.ResourceGroup.name  
  app_service_plan_id = azurerm_app_service_plan.AppServicePlanName.id  
  
  app_settings = {  
    "DeviceName" = "SampleDevice",  
    "DeviceId" = "2"  
  }  
}  