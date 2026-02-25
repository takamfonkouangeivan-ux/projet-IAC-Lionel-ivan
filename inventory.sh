#!bin/bash
#Récupère l'IP dpuis le state de Tofu (on remonte d'un dossier)

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