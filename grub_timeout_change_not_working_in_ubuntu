# GRUB_TIMEOUT Change – Not Working

### Change GRUB_TIMEOUT
```bash
sudo gedit /etc/default/grub
```
Comment the ***GRUB_TIMEOUT_STYLE*** option and set the ***GRUB_TIMEOUT***:
```bash
#GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=0
```
If you have already tried to change the ***GRUB_TIMEOUT*** but this still doesn’t work and the GRUB menu appears on every boot with the 30 second timeout, add the following line at the end of the ***/etc/default/grub*** file:
```bash
GRUB_RECORDFAIL_TIMEOUT=$GRUB_TIMEOUT
```
This sets the ***GRUB_RECORDFAIL_TIMEOUT*** to the same value as the ***GRUB_TIMEOUT***.

Generate a new configuration file:
```bash
sudo update-grub
```
Reboot the system to see if the GRUB’s timeout has changed.
