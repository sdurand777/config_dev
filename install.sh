#!/bin/sh
current_dir=$PWD
# edit crontab to run all script
SCRIPT="$current_dir/install_packages.sh"
echo "@reboot $SCRIPT >> /home/ivm/install_log 2>&1" | crontab -

# allow atomatic login to run everything
echo "[daemon]" | sudo tee -a /etc/gdm3/custom.conf
echo "AutomaticLoginEnable=true" | sudo tee -a  /etc/gdm3/custom.conf
echo "AutomaticLogin=$USER" | sudo tee -a /etc/gdm3/custom.conf

# retirer le mot de passe pour sudo
# Définir la commande à ajouter au fichier sudoers
NEW_SUDO_RULE="ivm ALL=(ALL) NOPASSWD: ALL"
# Ajouter la nouvelle règle au fichier sudoers en utilisant visudo
echo "$NEW_SUDO_RULE" | sudo EDITOR="tee -a" visudo -f /etc/sudoers
echo "Defaults timestamp_timeout=100" | sudo tee -a /etc/sudoers

# mask sleep
sudo systemctl mask sleep.target

echo "$(date +'%Y-%m-%d %H:%M:%S') ---------- INSTALLATION CONFIG INSTALLATION -------" >> /home/ivm/install_log

# reboot pour installer la config sudo crontab
sudo reboot

