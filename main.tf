terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54"
    }
  }
}
 
provider "openstack" {
  cloud = "ovh-sbg5"
}
resource "openstack_compute_keypair_v2" "tp_key" {
  name       = "Keypair"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "openstack_compute_instance_v2" "vm" {
  name            = "VMIsmael"
  image_name      = "Ubuntu 24.04"
  flavor_name     = "d2-2"
  key_pair = openstack_compute_instance_v2.tp_key.name
  security_groups = ["default"]

  network{
    name = "Ext-Net"
  }
}
 
output "instance_ip" {
  description = "IP publique de la VM"
  value       = openstack_compute_instance_v2.vm.network[0].fixed_ip_v4
}