# installation de mamba
export CONDA_DIR="$HOME/conda"
mkdir -p $HOME/conda
wget -O $HOME/Miniforge.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-$(uname -m).sh"
bash $HOME/Miniforge.sh -b -p $CONDA_DIR
rm $HOME/Miniforge.sh

