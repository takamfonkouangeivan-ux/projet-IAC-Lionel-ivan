terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54"
    }
  }

  backend "s3" {}
}

provider "openstack" {
  # Configuration lue automatiquement via variables d'environnement :
  # OS_AUTH_URL
  # OS_USERNAME
  # OS_PASSWORD
  # OS_REGION_NAME
  # OS_PROJECT_NAME
}