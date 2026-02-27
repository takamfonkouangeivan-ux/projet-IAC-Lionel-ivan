🚀 Get Started
📋 Prérequis système

Avant de commencer, assurez-vous d’avoir installé :

OpenTofu ≥ 1.6

Git

Python ≥ 3.10 (si Ansible ou scripts requis)

Ansible (optionnel selon le projet)

Accès SSH configuré vers les machines cibles

Un compte cloud configuré (AWS / Azure / GCP selon votre environnement)

Vérifiez vos installations :

tofu --version
git --version
python --version
ansible --version
⚙️ Initialisation du projet

Clonez le dépôt :

git clone <repo-url>
cd <repo-folder>

Initialisez OpenTofu :

tofu init

Cette commande :

Télécharge les providers

Initialise le backend

Prépare l’environnement de travail

🔍 Vérification du plan d’exécution

Avant tout déploiement :

tofu plan

Cela permet de :

Visualiser les ressources à créer/modifier

Vérifier qu’aucune suppression involontaire n’est prévue

🚀 Déploiement de l’infrastructure

Pour appliquer la configuration :

tofu apply

Confirmez avec yes lorsque demandé.

Pour un déploiement automatique (CI/CD) :

tofu apply -auto-approve
🧹 Suppression de l’infrastructure

Pour détruire les ressources créées :

tofu destroy
📁 Structure recommandée
.
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
└── README.md

Installation de l’AWS CLI
sudo apt update && sudo apt install awscli -y

Vérifiez l’installation :

aws --version
Création d’un bucket OVH Object Storage

Remplacez votre-nom-de-bucket par le nom que vous souhaitez donner au bucket et sbg par votre région OVH (par exemple gra pour Gravelines, rbx pour Roubaix, etc.) :

aws s3 mb s3://votre-nom-de-bucket --endpoint-url https://s3.sbg.perf.cloud.ovh.net