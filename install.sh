# Update repositories
sudo pacman -Sy

# Install yay
git clone https://aur.archlinux.org/yay yay
cd yay
yes | makepkg -si
cd ..

# Install extras
sudo pacman -S --noconfirm \
xdg-user-dirs \
curl \
wget \
ttf-fira-code \
noto-fonts \
noto-fonts-emoji \
xorg \
linux-headers \
ntp \
gnome-menus \
networkmanager-openvpn \
chrome-gnome-shell

yay -S --noconfirm \
ocs-url

# Install interface
sudo pacman -S --noconfirm \
gnome-shell \
gnome-control-center \
nautilus \
gnome-tweaks \
gnome-calculator \
gdm \

yay -S --noconfirm \
gnome-console \
gnome-text-editor

# Prograns
sudo pacman -S --noconfirm \
firefox \
virtualbox \
terraform \
ansible \
docker \
vagrant \
discord

yay -S --noconfirm \
visual-studio-code-bin \
spotify \
snapd

# Python development
sudo pacman -S --noconfirm \
python3 \
python-pip \
poetry \
pyenv

# Configuration
## setup snap
sudo ln -s /var/lib/snapd/snap /snap

## Install oh my bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

## Add user to docker group
sudo usermod -aG docker $USER

## Load module
sudo modprobe vboxdrv

## Create home folders
xdg-user-dirs-Update

## Config NTP (Brasil)
sudo rm -rf /etc/ntp.conf
sudo mv ntp.conf /etc/ntp.conf
sudo ntpd -u ntp:ntp
sudo ln -sf /usr/share/zoneinfo/America/Maceio /etc/localtime

## Start services
sudo systemctl enable NetworkManager gdm snapd.socket docker systemd-networkd ntpd

## Reboot system
reboot
