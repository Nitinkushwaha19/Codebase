/** 
resource "azurerm_resource_group" "Resource-Group-AKS" {
  name     = "099.AKS-Resource-Group"
  location = "eastus"
}

resource "azurerm_container_registry" "ACR" {
  name                = "nitinacr"
  location            = azurerm_resource_group.Resource-Group-AKS.location
  resource_group_name = azurerm_resource_group.Resource-Group-AKS.name
  sku                 = "Basic"
  admin_enabled       = true
}


resource "azurerm_kubernetes_cluster" "AKS" {

  name = "Temp-AKS"

  location = azurerm_resource_group.Resource-Group-AKS.location

  resource_group_name = azurerm_resource_group.Resource-Group-AKS.name

  dns_prefix = "testaks"

  oidc_issuer_enabled = true

  kubernetes_version = "1.33.7"

  sku_tier = "Free"

  network_profile {

    network_plugin = "azure"

    network_plugin_mode = "overlay"

    network_policy = null

    load_balancer_sku = "standard"

    outbound_type = "loadBalancer"

    service_cidr = "10.0.0.0/16"

    dns_service_ip = "10.0.0.10"

    pod_cidrs = ["10.244.0.0/16"]

  }

  default_node_pool {

    name = "agentpool"

    vm_size = "Standard_L2aos_v4"

    auto_scaling_enabled = true

    min_count = 1

    max_count = 2

    max_pods = 200

    upgrade_settings {

      drain_timeout_in_minutes = 0

      max_surge = "10%"

      node_soak_duration_in_minutes = 0

    }

  }

  node_resource_group = "${azurerm_resource_group.Resource-Group-AKS.name}-AKS-Nodes"

  node_os_upgrade_channel = "NodeImage"

  automatic_upgrade_channel = "stable"

  workload_identity_enabled = true

  image_cleaner_enabled = true

  image_cleaner_interval_hours = 48

  identity {

    type = "SystemAssigned"

  }

}


resource "azurerm_role_assignment" "aks-acr-pull" {
  principal_id                     = azurerm_kubernetes_cluster.AKS.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.ACR.id
  skip_service_principal_aad_check = true
}

*/
