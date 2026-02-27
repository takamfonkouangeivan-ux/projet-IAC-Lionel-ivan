#!bin/bash
#Récupère l'IP dpuis le state de Tofu (on remonte d'un dossier)
IP=$(tofu output -raw instance_ip)


#Génère le JSON attendu par Ansible
echo "{
    \"all\: {
        \"hosts\": [\"$IP]"
    },
    \"_meta\": {
        \hostvars\":{
            \"$IP\":{
                \"ansible_user\": \"ubuntu\"
            }
        }
    }
}"

# Exemple de récupération IPs depuis OpenStack (ou autre source)
MANAGER_IP=$(openstack server list --name manager-node -f value -c Networks | cut -d= -f2)
WORKERS_IPS=$(openstack server list --name 'worker-*' -f value -c Networks | cut -d= -f2)

echo "[managers]"
echo "$MANAGER_IP"

echo "[workers]"
for ip in $WORKERS_IPS; do
  echo "$ip"
done