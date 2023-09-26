resource "azurerm_resource_group" "sre-test-rg" {
  name     = "sre-test-rg"
  location = "West Europe"
  tags = {
    team = "sre"
    shortname = "agi"
  }
}

resource "azurerm_kubernetes_cluster" "sre-test-aks-istio" {
  name                = "sre-test-aks-istio"
  location            = azurerm_resource_group.sre-test-rg.location
  resource_group_name = azurerm_resource_group.sre-test-rg.name
  dns_prefix          = "sre-test-aks"
  kubernetes_version  = "1.27.3"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    team = "sre"
    shortname = "agi"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.sre-test-aks-istio.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.sre-test-aks-istio.kube_config_raw
  sensitive = true
}
