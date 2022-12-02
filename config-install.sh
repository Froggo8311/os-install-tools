#!/bin/bash
mkdir /tmp/CarbonixInstall

echo "Installing necessary components..."
# Install Pacaur
pacman -Sy --noconfirm --needed archlinux-keyring
clear
pacman -S --noconfirm --needed sudo fakeroot expac jq meson fakechroot gtest patch make libunistring
mkdir /tmp/CarbonixInstall/pa-install
cd /tmp/Carbonix/Install/pa-install
wget https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz
wget https://aur.archlinux.org/cgit/aur.git/snapshot/auracle-git.tar.gz
tar -xf pacaur.tar.gz
tar -xf auracle-git.tar.xf
chmod -R 777 /tmp/CarbonixInstall/pa-install
cd auracle-git
sudo -u nobody makepkg
pacman -U --noconfirm auracle-git-*.pkg.tar.zst
cd ../pacaur
sudo -u nobody makepkg
pacman -U --noconfirm pacaur-*.pkg.tar.zst

echo "Installing window manager config..."
# Awesome WM Config
sudo git clone https://github.com/Carbonix-Dev/config-awesome /usr/share/awesome/themes/carbonix
sudo git clone https://github.com/Carbonix-Dev/bling /usr/share/awesome/themes/carbonix/modules/bling
clear

echo "Setting up home directories..."
# Create default user home directory folders
sudo mkdir /etc/skel/AppData
sudo mkdir /etc/skel/AppData/Local
sudo mkdir /etc/skel/AppData/Local/bin
sudo mkdir /etc/skel/AppData/Local/lib
sudo mkdir /etc/skel/AppData/Local/share
sudo mkdir /etc/skel/AppData/Local/share/config
sudo mkdir /etc/skel/AppData/Local/var
sudo mkdir /etc/skel/AppData/Roaming

sudo ln -s /usr/share/awesome/themes/carbonix /etc/skel/.config/awesome
sudo sh -c "echo 'exec awesome' > /etc/skel/.xinitrc"

echo "Installing zsh config..."
# Command-Lookup
sudo git clone https://github.com/Carbonix-Dev/command-lookup /tmp/CarbonixInstall/zsh/command-lookup
clear
sudo mkdir /usr/share/licenses/command-lookup
sudo mv /tmp/CarbonixInstall/zsh/command-lookup/LICENSE /usr/share/licenses/command-lookup
sudo mv /tmp/CarbonixInstall/zsh/command-lookup/usr/share/command-lookup /usr/share
sudo chmod -R +rx /usr/share/command-lookup /usr/share/licenses/command-lookup

# Oh-My-ZSH
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /tmp/CarbonixInstall/zsh/omz.sh
clear
sudo sed -i 's/HOME="${HOME:-$(eval echo ~$USER)}"/HOME="\/etc\/skel"/g' /tmp/CarbonixInstall/zsh/omz.sh
sudo sh -c "ZSH=/etc/skel/AppData/Local/share/oh-my-zsh KEEP_ZSHRC=no zsh /tmp/CarbonixInstall/zsh/omz.sh --unattended"
clear

# ZSHRC
sudo git clone https://github.com/Carbonix-Dev/config-zsh /tmp/CarbonixInstall/zsh
clear
sudo mv /tmp/CarbonixInstall/zsh/zshrc /etc/skel/AppData/Local/share/config/zshrc

