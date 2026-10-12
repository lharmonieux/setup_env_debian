#!/bin/bash

# check if git configs are already set up
make_config=0
err_code=0
if [ -n "$( ls -a $HOME/.gitconfig )" ]; then
	while true; do
		read -p "Il existe déjà des configurations git définies. Voulez-vous les écraser ? [y/n]" res
		if [ "$res" != "y" ] && [ "$res" != "n" ]; then
			echo "Répondez par y (oui) ou n (non)."
		elif [ "$res" = "y" ]; then
			make_config=1
			break
		else
			make_config=2
			echo "Annulation de l'installation de Git"
			break
		fi
	done

fi

# if we can config
if [ $make_config -eq 1 ] || [ $make_config -eq 0 ]; then
	name="Rick"
	mail="ndeloe_r@etna-alternance.net"

	# Set username and mail
	command1() { git config --global user.name $name; }
	command2() { git config --global user.email $mail; }

	# Set default editor
	command3() { git config --global core.editor "vim"; }

	# Set default branch name
	command4() { git config --global init.defaultBranch "main"; }

	command_list=(command1 command2 command3 command4)
	echo -e "\nConfiguration globale de Git..."
	for c in "${command_list[@]}"; do
		$c
		err_code=$?
		if [ $err_code -ne 0 ]; then
			echo "Problème rencontré lors de la configuration de git, $c"
			break
		fi

	done

	# exit if break during for
	if [ $err_code -ne 0 ]; then
		exit $err_code
	else
		echo "Git global configuré !"
	fi
fi

# Config ssh-agent
echo -e "\nConfiguration de ssh agent..."

# check if ssh key already exist
if [ -z "$(ls -a $HOME/.ssh/id_ed25519 2> /dev/null)" ]; then
	echo "Création de la clé ssh dans $HOME/ ..."
	ssh-keygen -t ed25519 -C "$mail" -f "$HOME/.ssh/id_ed25519"
else
	echo "Clé ssh trouvée !"
fi

# Running 
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_ed25519
