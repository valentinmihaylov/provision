wget -O- https://raw.githubusercontent.com/valentinmihaylov/provision/master/bootstrap.sh | bash

h1 Useful packages and commands

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
