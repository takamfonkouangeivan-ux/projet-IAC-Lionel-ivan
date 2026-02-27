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
terraform {
  backend "s3" {
    bucket                      = "BucketS3Ange"
    key                         = "terraform.tfstate"
    region                      = "gra" # ou sbg selon votre zone
    endpoint                    = "https://s3.gra.perf.cloud.ovh.net"
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true # Requis pour la compatibilité S3 hors-AWS
    skip_metadata_api_check     = true
  }
}
resource "openstack_compute_keypair_v2" "tp_key" {
  name       = "tp_key"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "openstack_compute_instance_v2" "vm" {
  name            = "VMIsmael"
  image_name      = "Ubuntu 24.04"
  flavor_name     = "d2-2"
  key_pair = openstack_compute_keypair_v2.tp_key.name
  security_groups = ["default"]

  network{
    name = "Ext-Net"
  }
}
 
output "instance_ip" {
  description = "IP publique de la VM"
  value       = openstack_compute_instance_v2.vm.network[0].fixed_ip_v4
}