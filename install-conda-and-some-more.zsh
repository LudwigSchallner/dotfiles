# Installs conda and additionnal python packages.

# Download an install miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh -b
rm Miniconda3-latest-Linux-x86_64.sh

source zshrc

pip install --force-reinstall --user pipx
pipx install --force black
pipx install --force dvc"[all]"
pipx install --force pre-commit
pipx install --force ranger-fm
pipx install --force tox
