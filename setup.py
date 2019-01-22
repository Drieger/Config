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
    * wallpaper

    :created by Drieger
"""
import os


CHECK_MARK = "\u2713"
BALLOT_MARK = "\u2717"
LEFT_PADDING = "  "

def set_wallpaper(location=None):
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

if __name__ == "__main__":
    print("Welcome, we will help you to setup your new environment\n")
    set_wallpaper()

