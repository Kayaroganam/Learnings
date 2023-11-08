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
[libnm0_1.36.4](https://workdrive.zoho.com/file/dx5ezac612f04a7e54d78b6855fa0ab66cb17)  
[network-manager_1.36.4](https://workdrive.zoho.com/file/dx5ez9d287217a5d34c259e6316f5951183e2)

Install the packages one by one.
```bash
sudo dpkg -i libnm0_1.36.4-2ubuntu1_amd64.deb
sudo dpkg -i network-manager_1.36.4-2ubuntu1_amd64.deb
```
