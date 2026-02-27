variable "auth_url" {
  description = "URL d'authentification OpenStack"
  type        = string
}

variable "username" {
  description = "Nom d'utilisateur OpenStack"
  type        = string
}

variable "password" {
  description = "Mot de passe OpenStack"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Nom du projet OpenStack"
  type        = string
}

variable "region" {
  description = "Région OpenStack"
  type        = string
}