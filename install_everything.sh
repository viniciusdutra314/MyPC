#install essential flatpaks
flatpak install flathub -y io.github.vikdevelop.SaveDesktop 
flatpak install flathub -y com.google.Chrome 
flatpak install flathub -y com.bitwarden.desktop 

#base
sudo pacman -Suy --noconfirm base-devel yay vim \
git cmake make valgrind gparted fastfetch \
btop tree cloc speedtest-cli ffmpeg 

#Virtualization
sudo pacman -Suy --noconfirm docker docker-compose \
distrobox \
virtualbox linux66-virtualbox-host-modules

#IDE
yay -Suy --noconfirm visual-studio-code-bin
sudo pacman -Suy --noconfirm github-cli

#Nvidia
yay -Suy --noconfirm envycontrol

if command -v nvidia-smi &>/dev/null; then
    echo "nvidia-smi exists"
    sudo apt install -y nvidia-cuda-toolkit
fi

#Terminal
sudo pacman -Suy --noconfirm tilix tmux zsh
sudo pacman -Rs --noconfirm gnome-terminal
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



sudo  pacman --noconfirm -Qdtq | sudo pacman --noconfirm -Rns -