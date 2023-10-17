backup=~shell-exe/Job08/Backup
output_file="number_connection-$(date +'%d-%m-%Y-%H:%M').txt"

nombre_connexion=$(journalctl | grep -c "session opened for user ikhlef")

if [ "$nombre_connexion" -gt 0 ]; then

	echo "$nombre_connexion connections de l'utilisateur - ikhlef - recencées"

	echo "$nombre_connexion" > "$output_file"

	tar -cf "$backup_dir/$output_file.tar" "$output_file"

	echo "Nombre de connexions de l'utilisateur - ikhlef - enregistré et archivé avec succès"

	rm "$output_file"
else
    	echo "Aucune connexion enregistrée pour l'utilisateur - ikhlef -"
fi
