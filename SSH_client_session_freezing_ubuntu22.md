# SSH client session freezing in ubuntu 22 

Check the Network Manager package version.
```bash
NetworkManager -V
```

### Answer
Degrade network-manager version 1.36.6 to 1.36.4.

Purge network-manager.
```bash
sudo apt-get purge network-manager
```

Download both packages given below.
[libnm0_1.36.4](http://archive.ubuntu.com/ubuntu/pool/main/n/network-manager/libnm0_1.36.4-2ubuntu1_amd64.deb)  
[network-manager_1.36.4](http://kr.archive.ubuntu.com/ubuntu/pool/main/n/network-manager/network-manager_1.36.4-2ubuntu1_amd64.deb)

Install the packages one by one.
```bash
sudo dpkg -i libnm0_1.36.4-2ubuntu1_amd64.deb
sudo dpkg -i network-manager_1.36.4-2ubuntu1_amd64.deb
```
