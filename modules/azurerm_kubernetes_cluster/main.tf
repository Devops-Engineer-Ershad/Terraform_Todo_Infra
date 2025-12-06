resource "azurerm_kubernetes_cluster" "k8s_cluster" {
    name                = var.aks_name
    location            = var.location
    resource_group_name = var.rg_name
    dns_prefix         = var.dns_prefix

    default_node_pool {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_DC2as_v5"
    }

    identity {
        type = "SystemAssigned"
    }

    tags = var.tags

     role_based_access_control_enabled = true
    
    api_server_access_profile {
    authorized_ip_ranges = [
      "10.0.0.0/24" , "152.58.132.71"
    ]
  }
    
    network_profile {
    network_plugin = "azure"   
    network_policy = "calico"
  }

}

