echo "Install yay"
git clone https://aur.archlinux.org/yay ~/yay
cd ~/yay
yes | makepkg -si

echo "Install yay packages"
yay -S  --noconfirm \
visual-studio-code-bin \
ocs-url \
chrome-gnome-shell \
spotify

echo "Setup snap"
sudo ln -s /var/lib/snapd/snap /snap

echo "Install utils"
sudo pacman -S  --noconfirm \
xdg-user-dirs \
curl \
wget \
htop \
ttf-fira-code \
noto-fonts \
noto-fonts-emoji \
xorg \
firefox \
discord

echo "Install GUI"
sudo pacman -S --noconfirm\
gnome-shell \
gnome-control-center \
nautilus \
gnome-tweaks \
gnome-terminal \
gedit \
gnome-calculator \
gdm \
gnome-menus

echo "Install python setup"
sudo pacman -S   --noconfirm\
python3 \
python-pip \
poetry \
pyenv

echo "Install devops tools"
sudo pacman -S   --noconfirm\
ansible \
vagrant \
terraform \
docker \
virtualbox

echo "Install oh my bash"
yes | bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

echo "Add user to docker group"
sudo usermod -aG docker $USER

echo "Start services"
sudo systemctl enable NetworkManager wpa_supplicant gdm snapd.socket docker
reboot
