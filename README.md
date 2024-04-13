## provisioning for a new computer

### test on the new one

`wget -O- https://raw.githubusercontent.com/valentinmihaylov/provision/master/test-on-new-pc.sh | bash -s user@pc.local /path/to/bitbucket-pass-file`

### test on the old one

go to devops/vagrant dir and
`./run_vagrant.sh`

### run to provision the new one

`wget -O- https://raw.githubusercontent.com/valentinmihaylov/provision/master/install-new-pc.sh | bash -s user@pc.local /path/to/bitbucket-pass-file`

## provision raspi
### pitech

* flash SD card
  * Using the raspi imager
  * enable ssh and paste `id_rsa.pub` in `authorized_keys`
  * FLASH, then mount `/bootfs` & `/rootfs`
  * disable wlan0
    ```bash
    sudo sh -c "echo '\ndtoverlay=disable-wifi\ndtoverlay=disable-bt' >> /media/"$(whoami)"/bootfs/config.txt"
    ```
  * prepare first boot
    ```bash
    cp set-static-ip.sh /media/"$(whoami)"/rootfs/home/pi/
    sudo cp /media/"$(whoami)"/rootfs/etc/rc.local /media/"$(whoami)"/rootfs/etc/rc.local.bkp
    sudo cp pitech.rc.local /media/"$(whoami)"/rootfs/etc/rc.local
    ```
  * configure SWAP
    ```bash
    sudo sed -i 's/CONF_SWAPSIZE=[[:digit:]]\+/CONF_SWAPSIZE=4096/g' /media/"$(whoami)"/rootfs/etc/dphys-swapfile
    ```

* login via ssh & clean up:
  ```bash
  ssh-keygen -f "/home/waliu/.ssh/known_hosts" -R "pitech.local"
  ssh-pitech
  sudo mv /etc/rc.local.bkp /etc/rc.local && rm /home/pi/set-static-ip.sh
  ```
* enable cgroups
  ```bash
  sudo sh -c "echo ' cgroup_enable=memory cgroup_memory=1' >> /boot/cmdline.txt"
  sudo reboot
  ```
* start installation  
  ```bash
  wget -O- https://raw.githubusercontent.com/valentinmihaylov/provision/master/install-pi-tech.sh | bash
  ```
* refresh kube config
  ```bash
  mv ~/.kube/config ~/.kube/config.bkp
  scp pi@pitech.local:~/.kube/config ~/.kube/config
  chmod 700 ~/.kube/config
  # test with 'helm list' or 'kubens'
  ```

### media
* disable wlan0
  ```bash
  sudo nano /boot/config.txt
  ### Under "Additional overlays and parameters are documented" add these 2 lines
  dtoverlay=disable-wifi
  dtoverlay=disable-bt
  ```
* start installation  
  ```bash
  wget -O- https://raw.githubusercontent.com/valentinmihaylov/provision/master/install-pi-media.sh | bash
  ```

## Useful packages and commands

```bash
sudo apt-get install     apt-transport-https     ca-certificates     curl     software-properties-common

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer


sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo grub-customizer
sudo dpkg-reconfigure unattended-upgrades
sudo add-apt-repository ppa:tualatrix/ppa
sudo add-apt-repository ppa:tualatrix/next
sudo apt-get install ubuntu-tweak


sudo apt-get install network-manager-openvpn
sudo apt-get install network-manager-openvpn-gnome

sudo add-apt-repository ppa:jtaylor/keepass
sudo apt install keepass2

sudo add-apt-repository ppa:musicbrainz-developers/stable


sudo apt install libpam-fprintd fprint-demo
sudo apt-get install fprint-demo libfprint-dev libfprint0 libpam-fprint aes2501-wy
pam_fprint_enroll
sudo fprintd-enroll -f right-index-finger waliu

curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install

gsettings list-schemas
gsettings list-schemas | grep touch
gsettings get org.gnome.settings-daemon.peripherals.touchpad
gsettings get org.gnome.settings-daemon.peripherals.touchpad horiz-scroll-enabled
gsettings set org.gnome.settings-daemon.peripherals.touchpad horiz-scroll-enabled "false"
gsettings get org.gnome.desktop.peripherals.touchpad horiz-scroll-enabled
gsettings
gsettings list-keys  org.gnome.desktop.peripherals.touchpad
gsettings get org.gnome.desktop.peripherals.touchpad tap-to-click
gsettings get org.gnome.desktop.peripherals.touchpad click-method
gsettings get org.gnome.desktop.peripherals.touchpad scroll-method
synclient HorizTwoFingerScroll=1
synclient HorizTwoFingerScroll=0

pdftk some.pdf cat 1 output some.pdf2
pdf-search -i ".*bonus.*" ".*targo.*2016.*pdf"
sudo apt-get install calibre
ebook-convert Argentina\ 2014\ -\ Lonely\ Planet.epub Arg.mobi
```
