variable "cloud_project_kubes" {
  description = <<EOT
Map of cloud_project_kubes, attributes below
Required:
    - region
    - service_name
Optional:
    - kube_proxy_mode
    - load_balancers_subnet_id
    - name
    - nodes_subnet_id
    - plan
    - private_network_id
    - update_policy
    - version
    - customization (block):
        - apiserver (optional, block):
            - admissionplugins (optional, block):
                - disabled (optional)
                - enabled (optional)
    - customization_apiserver (block):
        - admissionplugins (optional, block):
            - disabled (optional)
            - enabled (optional)
    - customization_cilium (block):
        - cluster_id (optional)
        - cluster_mesh (optional, block):
            - api_server (optional, block):
                - node_port (optional)
                - service_type (optional)
            - enabled (optional)
        - hubble (optional, block):
            - enabled (optional)
            - relay (optional, block):
                - enabled (optional)
            - ui (optional, block):
                - backend_resources (optional, block):
                    - limits (optional, block):
                        - cpu (optional)
                        - memory (optional)
                    - requests (optional, block):
                        - cpu (optional)
                        - memory (optional)
                - enabled (optional)
                - frontend_resources (optional, block):
                    - limits (optional, block):
                        - cpu (optional)
                        - memory (optional)
                    - requests (optional, block):
                        - cpu (optional)
                        - memory (optional)
    - customization_kube_proxy (block):
        - iptables (optional, block):
            - min_sync_period (optional)
            - sync_period (optional)
        - ipvs (optional, block):
            - min_sync_period (optional)
            - scheduler (optional)
            - sync_period (optional)
            - tcp_fin_timeout (optional)
            - tcp_timeout (optional)
            - udp_timeout (optional)
    - ip_allocation_policy (block):
        - pods_ipv4_cidr (optional)
        - services_ipv4_cidr (optional)
    - private_network_configuration (block):
        - default_vrack_gateway (required)
        - private_network_routing_as_default (required)
    - timeouts (block):
        - create (optional)
        - default (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    region                   = string
    service_name             = string
    kube_proxy_mode          = optional(string)
    load_balancers_subnet_id = optional(string)
    name                     = optional(string)
    nodes_subnet_id          = optional(string)
    plan                     = optional(string)
    private_network_id       = optional(string)
    update_policy            = optional(string)
    version                  = optional(string)
    customization = optional(list(object({
      apiserver = optional(list(object({
        admissionplugins = optional(list(object({
          disabled = optional(list(string))
          enabled  = optional(list(string))
        })))
      })))
    })))
    customization_apiserver = optional(list(object({
      admissionplugins = optional(list(object({
        disabled = optional(list(string))
        enabled  = optional(list(string))
      })))
    })))
    customization_cilium = optional(object({
      cluster_id = optional(number)
      cluster_mesh = optional(object({
        api_server = optional(object({
          node_port    = optional(number)
          service_type = optional(string)
        }))
        enabled = optional(bool)
      }))
      hubble = optional(object({
        enabled = optional(bool)
        relay = optional(object({
          enabled = optional(bool)
        }))
        ui = optional(object({
          backend_resources = optional(object({
            limits = optional(object({
              cpu    = optional(string)
              memory = optional(string)
            }))
            requests = optional(object({
              cpu    = optional(string)
              memory = optional(string)
            }))
          }))
          enabled = optional(bool)
          frontend_resources = optional(object({
            limits = optional(object({
              cpu    = optional(string)
              memory = optional(string)
            }))
            requests = optional(object({
              cpu    = optional(string)
              memory = optional(string)
            }))
          }))
        }))
      }))
    }))
    customization_kube_proxy = optional(object({
      iptables = optional(object({
        min_sync_period = optional(string)
        sync_period     = optional(string)
      }))
      ipvs = optional(object({
        min_sync_period = optional(string)
        scheduler       = optional(string)
        sync_period     = optional(string)
        tcp_fin_timeout = optional(string)
        tcp_timeout     = optional(string)
        udp_timeout     = optional(string)
      }))
    }))
    ip_allocation_policy = optional(object({
      pods_ipv4_cidr     = optional(string)
      services_ipv4_cidr = optional(string)
    }))
    private_network_configuration = optional(object({
      default_vrack_gateway              = string
      private_network_routing_as_default = bool
    }))
    timeouts = optional(object({
      create  = optional(string)
      default = optional(string)
      delete  = optional(string)
      read    = optional(string)
      update  = optional(string)
    }))
  }))
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

