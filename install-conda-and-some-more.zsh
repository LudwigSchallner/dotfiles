# Installs conda and additionnal python packages.

# Download an install miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh -b
rm Miniconda3-latest-Linux-x86_64.sh

source zshrc

pip install --force-reinstall --user pipx pynvim jedi
pipx install --force black
pipx install --force dvc"[all]"
pipx install --force flake8
pipx install --force isort
pipx install --force pre-commit
pipx install --force ranger-fm
pipx install --force thefuck
pipx install --force tox
pipx install --force ueberzug
pipx install --force dunk
