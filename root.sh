#!/bin/bash
username = $(id -u -n 1000)

apt update
apt install xorg bspwm sxhkd rofi kitty neofetch -y

mkdir -p /home/$username/.config
cp -R .config/* /home/$username/.config/
chown -R $username:$username /home/$username
