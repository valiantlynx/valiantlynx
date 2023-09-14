#!/bin/bash
sudo apt-get update
git clone https://github.com/valiantlynx/mybash.git
cd mybash
sudo bash setup.sh -y
curl -L -o Meslo.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip
mkdir ~/.local/share/fonts
cp Meslo.zip ~/.local/share/fonts/
cd ~/.local/share/fonts/
sudo apt-get install unzip -y
unzip Meslo.zip
rm Meslo.zip
cd ~
rm Meslo.zip

sudo apt-get install tmux -y
sleep 3
sudo mkdir ~/.config
sudo mkdir ~/.config/nvim
sleep 3
sudo apt-get install curl -y
sudo curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage 
echo "installed appimage"
sleep 3

sudo ./nvim.appimage --appimage-extract
sleep 3

sudo ./squashfs-root/AppRun --version
sudo mv squashfs-root /
echo "moved it"
sleep 3
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
sudo mv nvim.appimage /usr/bin
echo "coppied over nvim.appimage"
sleep 3
cd ~/.config/nvim 
git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim

CUSTOM_NVIM_PATH=/usr/bin/nvim.appimage
set -u
sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
echo 'eval "$(starship init bash)"' >> ~/.bashrc
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.bashrc


sudo curl -Lo /usr/bin/theme.sh 'https://git.io/JM70M' && sudo chmod +x /usr/bin/theme.sh
sudo apt-get update
sudo apt-get install fzf -y
echo 'theme.sh nord' >> ~/.bashrc
