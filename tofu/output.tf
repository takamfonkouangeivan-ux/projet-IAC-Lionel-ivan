output "instance_ip" {
  description = "IP publique de la VM"
  value       = openstack_compute_instance_v2.vm.access_ip_v4
}