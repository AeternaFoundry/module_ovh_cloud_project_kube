output "cloud_project_kubes_id" {
  description = "Map of id values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no id are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cloud_project_kubes_control_plane_is_up_to_date" {
  description = "Map of control_plane_is_up_to_date values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no control_plane_is_up_to_date are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.control_plane_is_up_to_date if v.control_plane_is_up_to_date != null }
}
output "cloud_project_kubes_customization" {
  description = "Map of customization values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no customization are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.customization if v.customization != null && length(v.customization) > 0 }
}
output "cloud_project_kubes_customization_apiserver" {
  description = "Map of customization_apiserver values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no customization_apiserver are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.customization_apiserver if v.customization_apiserver != null && length(v.customization_apiserver) > 0 }
}
output "cloud_project_kubes_customization_cilium" {
  description = "Map of customization_cilium values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no customization_cilium are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => one(v.customization_cilium) if v.customization_cilium != null && length(v.customization_cilium) > 0 }
}
output "cloud_project_kubes_customization_kube_proxy" {
  description = "Map of customization_kube_proxy values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no customization_kube_proxy are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => one(v.customization_kube_proxy) if v.customization_kube_proxy != null && length(v.customization_kube_proxy) > 0 }
}
output "cloud_project_kubes_ip_allocation_policy" {
  description = "Map of ip_allocation_policy values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no ip_allocation_policy are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => one(v.ip_allocation_policy) if v.ip_allocation_policy != null && length(v.ip_allocation_policy) > 0 }
}
output "cloud_project_kubes_is_up_to_date" {
  description = "Map of is_up_to_date values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no is_up_to_date are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.is_up_to_date if v.is_up_to_date != null }
}
output "cloud_project_kubes_kube_proxy_mode" {
  description = "Map of kube_proxy_mode values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no kube_proxy_mode are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.kube_proxy_mode if v.kube_proxy_mode != null && length(v.kube_proxy_mode) > 0 }
}
output "cloud_project_kubes_kubeconfig" {
  description = "Map of kubeconfig values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no kubeconfig are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.kubeconfig if v.kubeconfig != null && length(v.kubeconfig) > 0 }
  sensitive   = true
}
output "cloud_project_kubes_kubeconfig_attributes" {
  description = "Map of kubeconfig_attributes values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no kubeconfig_attributes are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.kubeconfig_attributes if v.kubeconfig_attributes != null && length(v.kubeconfig_attributes) > 0 }
  sensitive   = true
}
output "cloud_project_kubes_load_balancers_subnet_id" {
  description = "Map of load_balancers_subnet_id values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no load_balancers_subnet_id are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.load_balancers_subnet_id if v.load_balancers_subnet_id != null && length(v.load_balancers_subnet_id) > 0 }
}
output "cloud_project_kubes_name" {
  description = "Map of name values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no name are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.name if v.name != null && length(v.name) > 0 }
}
output "cloud_project_kubes_next_upgrade_versions" {
  description = "Map of next_upgrade_versions values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no next_upgrade_versions are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.next_upgrade_versions if v.next_upgrade_versions != null && length(v.next_upgrade_versions) > 0 }
}
output "cloud_project_kubes_nodes_subnet_id" {
  description = "Map of nodes_subnet_id values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no nodes_subnet_id are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.nodes_subnet_id if v.nodes_subnet_id != null && length(v.nodes_subnet_id) > 0 }
}
output "cloud_project_kubes_nodes_url" {
  description = "Map of nodes_url values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no nodes_url are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.nodes_url if v.nodes_url != null && length(v.nodes_url) > 0 }
}
output "cloud_project_kubes_plan" {
  description = "Map of plan values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no plan are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.plan if v.plan != null && length(v.plan) > 0 }
}
output "cloud_project_kubes_private_network_configuration" {
  description = "Map of private_network_configuration values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no private_network_configuration are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => one(v.private_network_configuration) if v.private_network_configuration != null && length(v.private_network_configuration) > 0 }
}
output "cloud_project_kubes_private_network_id" {
  description = "Map of private_network_id values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no private_network_id are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.private_network_id if v.private_network_id != null && length(v.private_network_id) > 0 }
}
output "cloud_project_kubes_region" {
  description = "Map of region values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no region are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.region if v.region != null && length(v.region) > 0 }
}
output "cloud_project_kubes_service_name" {
  description = "Map of service_name values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no service_name are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.service_name if v.service_name != null && length(v.service_name) > 0 }
}
output "cloud_project_kubes_status" {
  description = "Map of status values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no status are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.status if v.status != null && length(v.status) > 0 }
}
output "cloud_project_kubes_update_policy" {
  description = "Map of update_policy values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no update_policy are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.update_policy if v.update_policy != null && length(v.update_policy) > 0 }
}
output "cloud_project_kubes_url" {
  description = "Map of url values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no url are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.url if v.url != null && length(v.url) > 0 }
}
output "cloud_project_kubes_version" {
  description = "Map of version values across all cloud_project_kubes, keyed the same as var.cloud_project_kubes except keys with no version are omitted"
  value       = { for k, v in ovh_cloud_project_kube.cloud_project_kubes : k => v.version if v.version != null && length(v.version) > 0 }
}

