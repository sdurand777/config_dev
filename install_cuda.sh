
#!/bin/bash

# Détection de la version d'Ubuntu
echo "Détection de la version d'Ubuntu..."
UBUNTU_VERSION=$(lsb_release -rs)

if [[ $UBUNTU_VERSION == "20.04" ]]; then
    CUDA_REPO="ubuntu2004"
elif [[ $UBUNTU_VERSION == "22.04" ]]; then
    CUDA_REPO="ubuntu2204"
else
    echo "Cette version d'Ubuntu ($UBUNTU_VERSION) n'est pas officiellement supportée par ce script."
    exit 1
fi

# Configuration du dépôt NVIDIA CUDA
echo "Ajout du dépôt CUDA pour Ubuntu $UBUNTU_VERSION..."

wget https://developer.download.nvidia.com/compute/cuda/repos/$CUDA_REPO/x86_64/cuda-$CUDA_REPO.pin -O cuda-repo-pin
if [[ $? -ne 0 ]]; then
    echo "Échec du téléchargement du fichier pin du dépôt CUDA."
    exit 1
fi
sudo mv cuda-repo-pin /etc/apt/preferences.d/cuda-repository-pin-600

sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$CUDA_REPO/x86_64/3bf863cc.pub
if [[ $? -ne 0 ]]; then
    echo "Échec de l'ajout de la clé GPG du dépôt CUDA."
    exit 1
fi

sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/$CUDA_REPO/x86_64/ /"
if [[ $? -ne 0 ]]; then
    echo "Échec de l'ajout du dépôt CUDA."
    exit 1
fi

# Mise à jour et installation de CUDA
echo "Mise à jour des sources APT..."
sudo apt update
if [[ $? -ne 0 ]]; then
    echo "Échec de la mise à jour des sources APT."
    exit 1
fi

echo "Installation de CUDA..."
sudo apt install -y cuda
if [[ $? -ne 0 ]]; then
    echo "Échec de l'installation de CUDA."
    exit 1
fi

# Configuration des variables d'environnement
echo "Configuration des variables d'environnement pour CUDA..."
echo -e "\n# CUDA configuration" >> ~/.bashrc
echo "export PATH=/usr/local/cuda/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc

source ~/.bashrc

# Vérification de l'installation
echo "Vérification de l'installation de CUDA..."
nvcc --version

if [[ $? -eq 0 ]]; then
    echo "CUDA a été installé avec succès."
else
    echo "Échec de l'installation de CUDA."
    exit 1
fi
