sudo apt update

# install nvm
echo '[NVM] configuring ...'
sudo apt install curl 
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
source ~/.bashrc
nvm install --lts
echo '[NVM] configured successfully'

# install fish
echo '[fish] configuring ...'
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt install -y fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install https://github.com/jhillyerd/plugin-git
curl -sS https://starship.rs/install.sh | sh
echo 'starship init fish | source' >> ~/.config/fish/config.fish
echo '[fish] configured successfully'

# install docker
curl -fsSL https://get.docker.com | bash
sudo groupadd docker
sudo usermod -aG docker $USER

# ssh
# ssh-keygen -t ed25519 -C "your_email" -P "" -f ~/.ssh/id_ed25519
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519
