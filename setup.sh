#!/bin/bash

#   author: Tsengwen <benson326789@gmail.com>
#   modified: 2019/04/23

sudo apt update
sudo apt install -y ssh vim gcc make cmake g++ gdb \
                    build-essential libncurses5-dev bison flex libssl-dev libelf-dev \
                    gcc-multilib g++-multilib binutils-multiarch libcap-dev libtesseract-dev \
                    python3 ipython-notebook \
                    p7zip-full zip unzip rar unrar \
                    htop \
                    exuberant-ctags cscope \
                    python-pip python3-pip \


sudo apt upgrade -y

## sublime 
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - 
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list 
sudo apt update
sudo apt install sublime-text -y
sudo apt-get install gcin gcin-qt5-immodule gcin-anthy gcin-voice -y
im-config -n gcin


MYPWD=$(pwd)

#Intsall Google Chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

cd ~

# bashrc
cat $MYPWD/bashrc >> .bashrc

# vim
rm -rf ~/.vimrc
ln -s $MYPWD/vimrc .vimrc

git config --global user.email "benson326789@gmail.com"
git config --global user.name "Tsengwen"
git config --global color.ui true
git config --global core.editor vim
git config --global alias.lg "log --color --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
git config --global alias.st status
git config --global alias.cm "commit -m"


# include .profile if it exists
if [ -f "$HOME/.profile" ]; then
	. "$HOME/.profile"
else
	. "$HOME/.bashrc"
fi

