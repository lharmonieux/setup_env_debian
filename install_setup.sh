#!/bin/bash

# package store updating
echo -e "Mise à jour du dépôt apt..."
sudo apt-get update

required_packages="git curl wget zsh vim"

# filter packages that are already installed
for p in $required_packages; do
	dpkg -s $p > /dev/null 2> /dev/null
	if [ $? -eq 0 ]; then
		echo "le paquet $p est déjà installé."
		required_packages=$(echo "$required_packages" | sed "s/$p//")
	fi
done

# installing remaining packages
if [ -n "$(echo "$required_packages" | tr -d '[:space:]')" ]; then
	echo -e "\nInstallation des paquets $required_packages"
	sudo apt install -y $required_packages

	err_code=$?
	if [ $? -ne 0 ]; then
		echo "Erreur lors de l'installation des paquets"
		exit $err_code
	fi
fi
