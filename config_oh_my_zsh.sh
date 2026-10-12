#!/bin/bash

# check if oh-my-zsh is already installed
echo -e "\nInstallation de oh my zsh ..."
if [ -n "$(ls -a "$HOME/.oh-my-zsh" 2> /dev/null)" ]; then
	echo "Oh-my-zsh est déjà installé. Si vous voulez le réinstaller, supprimez les répertoires $HOME/.oh-my-zsh et $HOME/.zshrc"
else
	RUNZSH=no CHSH=no UNATTENDED=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	echo -e "\nAjout des plugins à Oh My Zsh..."

	# checking .zshrc
	fichier="$HOME/.zshrc"
	if [ -z $(ls -a $fichier) 2> /dev/null ]; then
		touch $fichier
		$err_code=$?

		if [ $? -eq 0 ]; then
			echo -e "\nCréation du fichier $fichier..."
		else 
			echo -e "\nEchec de la création du fichier $fichier"
			exit $err_code
		fi
	fi

	# add plugins
	if grep -q '^plugins=' "$fichier"; then
	    sed -i 's/^plugins=.*/plugins=(git)/' "$fichier" 
	else
    		echo 'plugins=(git)' >> "$fichier"
	fi

	# edit theme
	if grep -q '^ZSH_THEME=' "$fichier"; then
		sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' "$fichier"
	else
		echo "ZSH_THEME=\"awesomepanda\"" >> "$fichier"
	fi

	echo -e "\nZsh sera utilisé comme shell par défaut. Entrez votre mot de passe"
	chsh -s /bin/zsh
fi
