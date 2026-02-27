terraform {
  backend "s3" {
    bucket                      = "bucketange"
    key                         = "terraform.tfstate"
    region                      = "gra"
    endpoint                    = "https://s3.gra.perf.cloud.ovh.net"
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
  }

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54"
    }
  }
}

# ✅ Provider configuré via variables
provider "openstack" {
  auth_url    = var.auth_url
  user_name   = var.username
  password    = var.password
  tenant_name = var.project_name
  region      = var.region
}

# -------------------------
# Ressources
# -------------------------
resource "openstack_compute_keypair_v2" "tp_key" {
  name       = "tp_key"
  public_key = file("/home/runner/.ssh/id_rsa.pub")
}

resource "openstack_compute_instance_v2" "vm" {
  name            = "AngeVM"
  image_name      = "Ubuntu 24.04"
  flavor_name     = "d2-2"
  key_pair        = openstack_compute_keypair_v2.tp_key.name
  security_groups = ["default"]

  network {
    name = "Ext-Net"
  }
}