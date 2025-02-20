#!/bin/bash
cd ~

# ------------------------
# apt install
# ------------------------
sudo apt update
sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl git git-lfs libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev cmake
sudo apt autoremove -y
sudo apt clean -y
git lfs install


# ------------------------
# pyenv install
# ------------------------
git clone https://github.com/pyenv/pyenv.git ${HOME}/.pyenv
cat << EOF >> ${HOME}/.profile
export PYENV_ROOT=\${HOME}/.pyenv
export PATH=\${PYENV_ROOT}/bin:\${PATH}
eval "\$(pyenv init --path)"
EOF
source ${HOME}/.profile
pyenv install 3.12.9
pyenv global 3.12.9
pyenv rehash
python -m pip install -U pip setuptools


# ------------------------
# llama.cpp install
# ------------------------
git clone https://github.com/ggml-org/llama.cpp
cd llama.cpp
mkdir build
cd build
cmake ..
cmake --build . --config Release
cd ..
python -m pip install -r requirements.txt
echo export PATH=\${HOME}/llama.cpp/build/bin:\${PATH} >> ${HOME}/.profile
source ${HOME}/.profile
cd ~


# ------------------------
# end
# ------------------------
echo "------------------------"
echo "complete."
echo "------------------------"
git lfs --version
python -V
pip -V
echo "llama.cpp"
llama-cli --version
