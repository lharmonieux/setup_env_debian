# Projet de configuration d'une VM

Un développeur reconfigure son environnement plusieurs fois dans sa carrière : nouvelle machine, VM réinitialisée, accès à un serveur vierge. À chaque fois, les mêmes outils, les mêmes configs, les mêmes alias — refaits à la main.

Ce projet a un objectif simple : ne plus jamais perdre ce temps.

## Ce que fait concrètement le programme

* Mise à jour du dépôt apt
* Installation des paquets git, curl, wget, zsh et vim
* Configuration de l'environnement git --global 
* Configuration de la clé ssh et ajout à l'agent ssh
* Installation et personnalisation automatique de Oh-my-zsh !

## Lancer le programme

* Les fichiers requis sont hébergés sur ce dépôt git (ssh ou https, en fonction des préférences)
```
ssh : git@rendu-git.etna-alternance.net:module-10500/activity-56463/group-1080856.git
https : https://rendu-git.etna-alternance.net/module-10500/activity-56463/group-1080856.git
```

* Pour télécharger le programmme, il faut créer un dossier vide dans votre machine debian et exécuter les commandes suivantes : 

```
cd dossier_créé
git clone (ssh ou https)
./setup.sh
```

Quelques informations plus tard, votre environnement sera prêt !
