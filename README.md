# setup_llamacpp_env
Setting up the llama.cpp environment

## How to use

### CPU Build
```
git clone https://github.com/yasu-oh/setup_llamacpp_env
cd setup_llamacpp_env/
./setup.sh
source ${HOME}/.profile
```

### CUDA
[This provides GPU acceleration using an NVIDIA GPU. Make sure to have the CUDA toolkit installed.](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md#cuda)
```
git clone https://github.com/yasu-oh/setup_llamacpp_env
cd setup_llamacpp_env/
./setup.sh cuda
source ${HOME}/.profile
```
