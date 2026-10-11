resource "ovh_cloud_project_kube" "cloud_project_kubes" {
  for_each = var.cloud_project_kubes

  region                   = each.value.region
  service_name             = each.value.service_name
  kube_proxy_mode          = each.value.kube_proxy_mode
  load_balancers_subnet_id = each.value.load_balancers_subnet_id
  name                     = each.value.name
  nodes_subnet_id          = each.value.nodes_subnet_id
  plan                     = each.value.plan
  private_network_id       = each.value.private_network_id
  update_policy            = each.value.update_policy
  version                  = each.value.version

  dynamic "customization" {
    for_each = each.value.customization != null ? each.value.customization : []
    content {
      dynamic "apiserver" {
        for_each = customization.value.apiserver != null ? customization.value.apiserver : []
        content {
          dynamic "admissionplugins" {
            for_each = apiserver.value.admissionplugins != null ? apiserver.value.admissionplugins : []
            content {
              disabled = admissionplugins.value.disabled
              enabled  = admissionplugins.value.enabled
            }
          }
        }
      }
    }
  }

  dynamic "customization_apiserver" {
    for_each = each.value.customization_apiserver != null ? each.value.customization_apiserver : []
    content {
      dynamic "admissionplugins" {
        for_each = customization_apiserver.value.admissionplugins != null ? customization_apiserver.value.admissionplugins : []
        content {
          disabled = admissionplugins.value.disabled
          enabled  = admissionplugins.value.enabled
        }
      }
    }
  }

  dynamic "customization_cilium" {
    for_each = each.value.customization_cilium != null ? [each.value.customization_cilium] : []
    content {
      cluster_id = customization_cilium.value.cluster_id
      dynamic "cluster_mesh" {
        for_each = customization_cilium.value.cluster_mesh != null ? [customization_cilium.value.cluster_mesh] : []
        content {
          dynamic "api_server" {
            for_each = cluster_mesh.value.api_server != null ? [cluster_mesh.value.api_server] : []
            content {
              node_port    = api_server.value.node_port
              service_type = api_server.value.service_type
            }
          }
          enabled = cluster_mesh.value.enabled
        }
      }
      dynamic "hubble" {
        for_each = customization_cilium.value.hubble != null ? [customization_cilium.value.hubble] : []
        content {
          enabled = hubble.value.enabled
          dynamic "relay" {
            for_each = hubble.value.relay != null ? [hubble.value.relay] : []
            content {
              enabled = relay.value.enabled
            }
          }
          dynamic "ui" {
            for_each = hubble.value.ui != null ? [hubble.value.ui] : []
            content {
              dynamic "backend_resources" {
                for_each = ui.value.backend_resources != null ? [ui.value.backend_resources] : []
                content {
                  dynamic "limits" {
                    for_each = backend_resources.value.limits != null ? [backend_resources.value.limits] : []
                    content {
                      cpu    = limits.value.cpu
                      memory = limits.value.memory
                    }
                  }
                  dynamic "requests" {
                    for_each = backend_resources.value.requests != null ? [backend_resources.value.requests] : []
                    content {
                      cpu    = requests.value.cpu
                      memory = requests.value.memory
                    }
                  }
                }
              }
              enabled = ui.value.enabled
              dynamic "frontend_resources" {
                for_each = ui.value.frontend_resources != null ? [ui.value.frontend_resources] : []
                content {
                  dynamic "limits" {
                    for_each = frontend_resources.value.limits != null ? [frontend_resources.value.limits] : []
                    content {
                      cpu    = limits.value.cpu
                      memory = limits.value.memory
                    }
                  }
                  dynamic "requests" {
                    for_each = frontend_resources.value.requests != null ? [frontend_resources.value.requests] : []
                    content {
                      cpu    = requests.value.cpu
                      memory = requests.value.memory
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "customization_kube_proxy" {
    for_each = each.value.customization_kube_proxy != null ? [each.value.customization_kube_proxy] : []
    content {
      dynamic "iptables" {
        for_each = customization_kube_proxy.value.iptables != null ? [customization_kube_proxy.value.iptables] : []
        content {
          min_sync_period = iptables.value.min_sync_period
          sync_period     = iptables.value.sync_period
        }
      }
      dynamic "ipvs" {
        for_each = customization_kube_proxy.value.ipvs != null ? [customization_kube_proxy.value.ipvs] : []
        content {
          min_sync_period = ipvs.value.min_sync_period
          scheduler       = ipvs.value.scheduler
          sync_period     = ipvs.value.sync_period
          tcp_fin_timeout = ipvs.value.tcp_fin_timeout
          tcp_timeout     = ipvs.value.tcp_timeout
          udp_timeout     = ipvs.value.udp_timeout
        }
      }
    }
  }

  dynamic "ip_allocation_policy" {
    for_each = each.value.ip_allocation_policy != null ? [each.value.ip_allocation_policy] : []
    content {
      pods_ipv4_cidr     = ip_allocation_policy.value.pods_ipv4_cidr
      services_ipv4_cidr = ip_allocation_policy.value.services_ipv4_cidr
    }
  }

  dynamic "private_network_configuration" {
    for_each = each.value.private_network_configuration != null ? [each.value.private_network_configuration] : []
    content {
      default_vrack_gateway              = private_network_configuration.value.default_vrack_gateway
      private_network_routing_as_default = private_network_configuration.value.private_network_routing_as_default
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create  = timeouts.value.create
      default = timeouts.value.default
      delete  = timeouts.value.delete
      read    = timeouts.value.read
      update  = timeouts.value.update
    }
  }
}

