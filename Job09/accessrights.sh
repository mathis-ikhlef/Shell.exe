#!/bin/bash
cat "$fichier_csv" | column -t -s ","
fichier_csv=/home/ikhlef/shell-exe/Job09/Shell_Userlist.csv

tail -n +2 "$fichier_csv" | while IFS=',' read -r id prenom nom mdp role;
    do
    echo "Lecture : id=$id, prenom=$prenom, nom=$nom, mdp=$mdp, role=$role"
    role=$(echo "$role" | tr -d '\r')

    if [ "$id" != "Id" ];
    then
        username="${prenom}_${nom}"

        if [ "$role" = "Admin" ];
        then
            sudo useradd -m "$username" -p "$mdp"
            sudo usermod -aG sudo "$username"
            echo "Utilisateur '$username' créé avec des permissions d'admin."
        else
            sudo useradd -m "$username" -p "$mdp"
            echo "Utilisateur '$username' créé en tant qu'utilisateur standard."
        fi
    fi
done < $fichier_csv
