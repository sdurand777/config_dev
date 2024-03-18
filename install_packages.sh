#!/bin/sh

# attente
echo "$(date +'%Y-%m-%d %H:%M:%S') ---------- ATTENTE ------------" >> /home/ivm/install_log
sleep 10

# mettre a jour
sudo apt update
# upgrade
sudo apt upgrade -y
# installer des trucs utiles
sudo apt install net-tools -y
sudo apt install ssh -y
sudo apt install build-essential -y
sudo apt install terminator -y
sudo apt install mesa-utils -y
#sudo apt install qt5-default -y
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install python3-venv -y
sudo apt install python-is-python3 -y

sudo apt install htop -y
sudo apt install qtbase5-dev qt5-qmake -y
echo "$(date +'%Y-%m-%d %H:%M:%S') ------- INSTALLATION PACKAGES LINUX ----------------" >> /home/ivm/install_log

# installer packages pour neovim
sudo apt install vim -y
sudo apt install vim-gtk3 -y

# neovim
RUN git clone https://github.com/neovim/neovim /tmp/neovim 
WORKDIR /tmp/neovim 
RUN git checkout stable 

RUN apt install gettext -y

RUN make CMAKE_BUILD_TYPE=RelWithDebInfo 
RUN make install

# node
sudo apt install nodejs npm -y
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo n latest

# cmake
RUN apt install -y libssl-dev
# RUN git clone https://github.com/Kitware/CMake.git ~/cmake
# RUN cd ~/cmake
# RUN ./bootstrap && make -j6 && sudo make install
RUN apt install cmake -y

# autres libs
sudo apt install ripgrep -y
sudo apt install fd-find -y
sudo apt install latexmk texlive-full -y
sudo apt install git -y

sudo apt install curl -y
sudo apt install xclip -y

pip install pynvim
pip install numpy
npm install -g neovim

sudo apt install clang -y
sudo apt install clangd -y

cp -r ~/confif_dev/submodules/nvim ~/.config/nvim


# installer driver nvidia
sudo apt install $(nvidia-detector) -y

# installer nvidia cuda toolkit nvcc
sudo apt install nvidia-cuda-toolkit

echo 'export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}'
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}'



# wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
# sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
# sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub -y
# sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /" -y
# sudo apt-get update -y 
# # installing CUDA-11.3
# sudo apt install cuda-toolkit-11-3 -y
# setup your paths
# echo 'export PATH=/usr/local/cuda-11.3/bin:$PATH' >> ~/.bashrc
# echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.3/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc


source ~/.bashrc
sudo ldconfig
echo "$(date +'%Y-%m-%d %H:%M:%S') ------- INSTALLATION UTILS NVIDIA ----------------" >> /home/ivm/install_log



# # installer des packages python
# pip install pyside2
# pip install opencv-python
# pip install tqdm
# echo "$(date +'%Y-%m-%d %H:%M:%S') ------- INSTALLATION UTILS PYTHON ----------------" >> /home/ivm/install_log
#
# # installer les cles ssh
# cp -r /home/ivm/install_slam/.ssh/ ~/
# # installer docker
# sudo apt install docker -y
# sudo apt install nvidia-docker2 -y
# # add docker to sudo
# sudo groupadd docker
# sudo usermod -aG docker ivm
#
# echo "$(date +'%Y-%m-%d %H:%M:%S') ------- INSTALLATION UTILS DOCKER ----------------" >> /home/ivm/install_log
#
# # inserer disque 2
# SCRIPT="/home/ivm/install_slam/install_disque_2.sh"
# echo "@reboot $SCRIPT >> /home/ivm/install_log 2>&1" | crontab -

echo "$(date +'%Y-%m-%d %H:%M:%S') ------- INSTALLATION DISQUE 1 ----------------" >> /home/ivm/install_log

#
# nettoyer le crontab
echo "" | crontab -

# reboot PC
sudo reboot
