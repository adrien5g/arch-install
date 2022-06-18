echo "Install yay"
git clone https://aur.archlinux.org/yay ~/yay
cd ~/yay
yes | makepkg -si

echo "Install yay packages"
yes | yay -S \
snapd \
visual-studio-code-bin \
ocs-url \
chrome-gnome-shell

echo "Install utils"
yes | sudo pacman -S \
xdg-user-dirs \
curl \
wget \
htop \
ttf-fira-code \
noto-fonts \
noto-fonts-emoji \
xorg

echo "Install GUI"
yes | sudo pacman -S \
gnome-shell \
gnome-control-center \
nautilus \
gnome-tweaks \
gnome-terminal \
gedit \
gnome-calculator \
gdm

echo "Install python setup"
yes | sudo pacman -S \
python3 \
python-pip \
poetry \
pyenv

echo "Install devops tools"
yes | sudo pacman -S \
ansible \
vagrant \
terraform \
docker \
virtualbox

echo "Install oh my bash"
yes | bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

echo "Start services"
sudo systemctl enable NetworkManager wpa_supplicant gdm
reboot