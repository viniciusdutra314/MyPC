#install essential flatpaks
flatpak install flathub io.github.vikdevelop.SaveDesktop \
com.google.Chrome com.bitwarden.desktop -y 

#base
sudo pacman -Suy --noconfirm base-devel yay vim \
git cmake make valgrind gparted fastfetch \ 
btop tree cloc speedtest-cli ffmpeg 

#Virtualization
sudo pacman -Suy --noconfirm docker docker-compose \
distrobox \
virtualbox linux66-virtualbox-host-modules \
sudo systemctl start docker.service
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo docker run hello-world

#IDE
sudo yay -Suy --noconfirm visual-studio-code-bin
sudo pacman -Suy github-cli

#Nvidia
yay -Suy envycontrol

if command -v nvidia-smi &>/dev/null; then
    echo "nvidia-smi exists"
    sudo apt install -y nvidia-cuda-toolkit
fi

#Terminal
sudo pacman -Suy tilix tmux zsh
sudo pacman -Rs gnome-terminal
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'tilix'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/tilix'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Control><Alt>t'


#flameshot
gsettings set org.gnome.shell.keybindings show-screenshot-ui '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'flatpak run org.flameshot.Flameshot gui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding 'Print'


#Others
yay -Suy --noconfirm gnome-shell-pomodoro


#Remove unused packages



sudo  pacman -Qdtq | sudo pacman -Rns -