# Installation of CUDA

## CUDA Toolkit
```sh
sudo apt purge cuda-*
sudo apt purge nvidia-*
sudo apt autopurge
sudo apt install nvidia-driver-510
wget https://developer.download.nvidia.com/compute/cuda/11.6.2/local_installers/cuda_11.6.2_510.47.03_linux.run
sudo sh cuda_11.6.2_510.47.03_linux.run
export PATH=$PATH:/usr/local/cuda-11.6/bin
sudo touch /etc/ld.so.conf.d/cuda-11.6-lib64.conf
sudo emacs -nw /etc/ld.so.conf.d/cuda-11.6-lib64.conf
# Add path /usr/local/cuda-11.6/lib64 to cuda-11.6-lib64.conf
```
## cuDNN    
```sh
# download cudnn-local-repo-ubuntu2204-8.5.0.96_1.0-1_amd64.deb from https://developer.nvidia.com/rdp/cudnn-archive
sudo dpkg -i cudnn-local-repo-ubuntu2204-8.5.0.96_1.0-1_amd64.deb
sudo cp /var/cudnn-local-repo-ubuntu2204-8.5.0.96/cudnn-local-7ED72349-keyring.gpg /usr/share/keyrings/cuda-archive-keyring.gpg
sudo dpkg -i cudnn-local-repo-ubuntu2204-8.5.0.96_1.0-1_amd64.deb
```
