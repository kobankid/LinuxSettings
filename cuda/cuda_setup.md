# Installation of CUDA

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
