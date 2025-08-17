terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "4.33.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "res-0" {
  location   = "eastus2"
  managed_by = ""
  name       = "rg-aaima-cdl-dev-eus2"
  tags = {
    ringValue = "r0"
  }
}
resource "azurerm_firewall" "res-1" {
  dns_proxy_enabled   = false
  dns_servers         = []
  firewall_policy_id  = ""
  location            = "eastus2"
  name                = "firewall-vnet-aaima-cdl-core-eus2"
  private_ip_ranges   = []
  resource_group_name = "rg-aaima-cdl-dev-eus2"
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  tags                = {}
  threat_intel_mode   = "Alert"
  zones               = []
  ip_configuration {
    name                 = "ipConfig"
    public_ip_address_id = azurerm_public_ip.res-5.id
    subnet_id            = azurerm_subnet.res-7.id
  }
}
resource "azurerm_network_security_group" "res-2" {
  location            = "eastus2"
  name                = "vnet-aaima-cdl-core-eus2-DatabaseSubnet-nsg"
  resource_group_name = "rg-aaima-cdl-dev-eus2"
  security_rule       = []
  tags = {
    CASG-Info = "https://aka.ms/cloudgov"
    Creator   = "Automatically added by CloudGov Azure Policy"
  }
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_network_security_group" "res-3" {
  location            = "eastus2"
  name                = "vnet-aaima-cdl-core-eus2-PublicWebServiceSubnet-nsg"
  resource_group_name = "rg-aaima-cdl-dev-eus2"
  security_rule       = []
  tags = {
    CASG-Info = "https://aka.ms/cloudgov"
    Creator   = "Automatically added by CloudGov Azure Policy"
  }
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_network_security_group" "res-4" {
  location            = "eastus2"
  name                = "vnet-aaima-cdl-core-eus2-SharedServicesSubnet-nsg"
  resource_group_name = "rg-aaima-cdl-dev-eus2"
  security_rule       = []
  tags = {
    CASG-Info = "https://aka.ms/cloudgov"
    Creator   = "Automatically added by CloudGov Azure Policy"
  }
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_public_ip" "res-5" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  edge_zone               = ""
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "eastus2"
  name                    = "vnet-aaima-cdl-core-eus2-firewall"
  resource_group_name     = "rg-aaima-cdl-dev-eus2"
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
  zones                   = []
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_virtual_network" "res-6" {
  address_space                  = ["10.20.0.0/16"]
  bgp_community                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  flow_timeout_in_minutes        = 0
  location                       = "eastus2"
  name                           = "vnet-aaima-cdl-core-eus2"
  private_endpoint_vnet_policies = "Disabled"
  resource_group_name            = "rg-aaima-cdl-dev-eus2"
  subnet = [{
    address_prefixes                              = ["10.20.0.0/24"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = azurerm_subnet_network_security_group_association.res-14.id
    name                                          = "SharedServicesSubnet"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = azurerm_network_security_group.res-4.id
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
    }, {
    address_prefixes                              = ["10.20.1.0/26"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = "/subscriptions/be919d3c-e0c6-4f3a-87f3-826d529e6788/resourceGroups/rg-aaima-cdl-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-aaima-cdl-core-eus2/subnets/AzureFirewallSubnet"
    name                                          = "AzureFirewallSubnet"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = ""
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
    }, {
    address_prefixes                              = ["10.20.1.64/27"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = "/subscriptions/be919d3c-e0c6-4f3a-87f3-826d529e6788/resourceGroups/rg-aaima-cdl-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-aaima-cdl-core-eus2/subnets/GatewaySubnet"
    name                                          = "GatewaySubnet"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = ""
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
    }, {
    address_prefixes                              = ["10.20.20.0/24"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = azurerm_subnet_network_security_group_association.res-9.id
    name                                          = "DatabaseSubnet"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = azurerm_network_security_group.res-2.id
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
    }, {
    address_prefixes                              = ["10.20.30.0/24"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = azurerm_subnet_network_security_group_association.res-12.id
    name                                          = "PublicWebServiceSubnet"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = azurerm_network_security_group.res-3.id
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
  }]
  tags = {}
}
resource "azurerm_subnet" "res-7" {
  address_prefixes                              = ["10.20.1.0/26"]
  default_outbound_access_enabled               = true
  name                                          = "AzureFirewallSubnet"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = "rg-aaima-cdl-dev-eus2"
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  virtual_network_name                          = "vnet-aaima-cdl-core-eus2"
  depends_on = [
    azurerm_virtual_network.res-6
  ]
}
resource "azurerm_subnet" "res-8" {
  address_prefixes                              = ["10.20.20.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "DatabaseSubnet"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = "rg-aaima-cdl-dev-eus2"
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  virtual_network_name                          = "vnet-aaima-cdl-core-eus2"
  depends_on = [
    azurerm_virtual_network.res-6
  ]
}
resource "azurerm_subnet_network_security_group_association" "res-9" {
  network_security_group_id = azurerm_network_security_group.res-2.id
  subnet_id                 = azurerm_subnet.res-8.id
}
resource "azurerm_subnet" "res-10" {
  address_prefixes                              = ["10.20.1.64/27"]
  default_outbound_access_enabled               = true
  name                                          = "GatewaySubnet"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = "rg-aaima-cdl-dev-eus2"
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  virtual_network_name                          = "vnet-aaima-cdl-core-eus2"
  depends_on = [
    azurerm_virtual_network.res-6
  ]
}
resource "azurerm_subnet" "res-11" {
  address_prefixes                              = ["10.20.30.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "PublicWebServiceSubnet"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = "rg-aaima-cdl-dev-eus2"
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  virtual_network_name                          = "vnet-aaima-cdl-core-eus2"
  depends_on = [
    azurerm_virtual_network.res-6
  ]
}
resource "azurerm_subnet_network_security_group_association" "res-12" {
  network_security_group_id = azurerm_network_security_group.res-3.id
  subnet_id                 = azurerm_subnet.res-11.id
}
resource "azurerm_subnet" "res-13" {
  address_prefixes                              = ["10.20.0.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "SharedServicesSubnet"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = "rg-aaima-cdl-dev-eus2"
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  virtual_network_name                          = "vnet-aaima-cdl-core-eus2"
  depends_on = [
    azurerm_virtual_network.res-6
  ]
}
resource "azurerm_subnet_network_security_group_association" "res-14" {
  network_security_group_id = azurerm_network_security_group.res-4.id
  subnet_id                 = azurerm_subnet.res-13.id
}
