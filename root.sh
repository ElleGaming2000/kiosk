#!/bin/bash
username=$(id -u -n 1000)

apt update
apt install xorg bspwm sxhkd rofi kitty neofetch -y

mkdir -p /home/$username/.config
cp -R .config/* /home/$username/.config/
chown -R $username:$username /home/$username

mkdir -p /etc/systemd/system/getty@tty1.service.d/
echo '[Service]
ExecStart=
ExecStart=-/sbin/agetty -a '$username' %I $TERM' > /etc/systemd/system/getty@tty1.service.d/override.conf

cp /home/$username/.profile /home/$username/.profile.bak
echo '[ "$(tty)" = "/dev/tty1" ] && exec startx' >> /home/$username/.profile

systemctl set-default multi-user.target