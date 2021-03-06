#!/bin/python3
# -*- coding: utf-8 -*-
"""
    Config.setup
    ~~~~~~~~~~~~

    Script to help setup of new systems, designed primarly
    for Ubuntu. It depends on python3 to run and setups
    the following environment

    * git
    * vim 8+
    * plug package manager
    * nvm
    * arc-theme
    * radix icons
    * wallpaper
    * fira code font

    :created by Drieger
"""
import os
import shutil
import pathlib


CHECK_MARK = "\u2713"
BALLOT_MARK = "\u2717"
LEFT_PADDING = "  "

def setup_shortcuts():
    """
    Disable `dock` launch with Super
    """
    os.system("gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false")

def setup_wallpaper(location=None):
    """
    Change the wallpaper to the one in the provided uri
    """
    if location is None:
        cwd = os.getcwd()
        location = os.path.join(cwd, 'img', 'wallpaper.jpg')

    output = "{padding}{mark} Changing wallpaper..."

    if not os.path.exists(location):
        print(output.format(padding=LEFT_PADDING, mark=BALLOT_MARK))
    else:
        os.system("gsettings set org.gnome.desktop.screensaver picture-uri {}".format(location))
        os.system("gsettings set org.gnome.desktop.background picture-uri {}".format(location))
        print(output.format(padding=LEFT_PADDING, mark=CHECK_MARK))

def setup_theme():
    """
    Install and change ubuntu theme to arc-theme
    """
    os.system('sudo apt install arc-theme')

    output = "{padding}{mark} Installing theme..."
    print(output.format(padding=LEFT_PADDING, mark=BALLOT_MARK))

def setup_icons():
    """
    Install icons package
    """
    os.chdir('/tmp')
    shutil.rmtree('flat-remix', ignore_errors=True)
    os.system('git clone https://github.com/daniruiz/flat-remix')
    shutil.copytree('/tmp/flat-remix', os.path.join(str(pathlib.Path.home()), '.icons'))
    os.system('gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix"')

    output = "{padding}{mark} Installing icons theme..."
    print(output.format(padding=LEFT_PADDING, mark=BALLOT_MARK))

def setup_fonts():
  """
  Install fonts package
  """
  os.system('sudo apt update && sudo apt install fonts-firacode')

  output = "{padding}{mark} Installing Fira Code font..."
  print(output.format(padding=LEFT_PADDING, mark=BALLOT_MARK))

def setup_applications():
  """
  Install basic applications
  """

  # VSCode
  os.system('sudo apt install software-properties-common apt-transport-https wget')
  os.system('wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -')
  os.system('sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"')
  os.system('sudo apt update && sudo apt install code -y')
  output = "{padding}{mark} Installing VSCode..."
  print(output.format(padding=LEFT_PADDING, mark=BALLOT_MARK))

  # Zsh
  os.system('sudo apt install zsh')
  os.system('chsh -s $(which zsh')
  output = "{padding}{mark} Installing Zsh..."
  print(output.format(padding=LEFT_PADDING, mark=BALLOT_MARK))


def setup_vim():
    """
    1 - sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

    2 - sudo apt remove vim vim-runtime gvim
    3 - cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-pythoninterp=yes \
	    --with-python-config-dir=/usr/lib/python2.7/config \ # pay attention here check directory correct
	    --enable-python3interp=yes \
	    --with-python3-config-dir=/usr/lib/python3.5/config \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
	   --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
    4 - cd ~/vim
sudo make install
    5 - sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
    """
    pass


if __name__ == "__main__":
    print("Welcome, we will help you to setup your new environment\n")
    #  setup_wallpaper()
    #  setup_theme()
    # setup_icons()
    # setup_fonts()
    # setup_applications()

