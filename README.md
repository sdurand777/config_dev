# config_dev
Update readme config dev
On a deux submodules pour bashrc et pour neovim
Attention il faut que les deux submodules soient aussi publics pour les pull facilement

# recuperation des deux submodules
git_init_submodule submodules/nvim https://github.com/sdurand777/config_neovim.git
git_init_submodule submodules/bashrc https://github.com/sdurand777/config_bashrc.git

# attention definir a la racine de repot principal dans le fichier .gitmodules ajouter
branch = main

# Les fichiers install.sh et install_packages.sh 
ces fichiers permettent une installation sur une machine ubuntu 22.04 vide on va avoir un reboot auto pour installation des drivers cuda automatique install.sh lance automatiquement install_packages.sh pour une installation complete

# gestion versioning
git clone --recursive pour avoir les fichiers des submodules pour pouvoir les modifier si besoin

Dans le dossier config_dev en premier lancer la commande custom git_pull_all pour mettre a jour les submodules si il y a eu des modifs
