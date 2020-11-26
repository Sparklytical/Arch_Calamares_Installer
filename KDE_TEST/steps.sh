#!/bin/bash

[[ -d ./releng ]] && rm -r ./releng
[[ -d ./work ]] && rm -r ./work
sleep 2

cp -r /usr/share/archiso/configs/releng/ ./

#Delete automatic login and default network configuration
[[ -d ./releng/airootfs/etc/systemd/system/getty@tty1.service.d ]] && rm -r ./releng/airootfs/etc/systemd/system/getty@tty1.service.d
[[ -d ./releng/airootfs/etc/systemd/network ]] && rm -r ./releng/airootfs/etc/systemd/network
[[ -d ./releng/airootfs/etc/systemd/system/systemd-networkd-wait-online.service.d ]] && rm -r ./releng/airootfs/etc/systemd/system/systemd-networkd-wait-online.service.d
[[ -f ./releng/airootfs/etc/systemd/system/dbus-org.freedesktop.network1.service ]] && rm ./releng/airootfs/etc/systemd/system/dbus-org.freedesktop.network1.service
[[ -f ./releng/airootfs/etc/systemd/system/multi-user.target.wants/systemd-networkd.service ]] && rm ./releng/airootfs/etc/systemd/system/multi-user.target.wants/systemd-networkd.service
[[ -f ./releng/airootfs/etc/systemd/system/multi-user.target.wants/iwd.service ]] && rm ./releng/airootfs/etc/systemd/system/multi-user.target.wants/iwd.service
[[ -f ./releng/airootfs/etc/systemd/system/sockets.target.wants/systemd-networkd.socket ]] && rm ./releng/airootfs/etc/systemd/system/sockets.target.wants/systemd-networkd.socket
[[ -f ./releng/airootfs/etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service ]] && rm ./releng/airootfs/etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service

#Delete customize_airootfs.sh, it's not needed anymore.
[[ -f ./releng/airootfs/root/customize_airootfs.sh ]] && rm ./releng/airootfs/root/customize_airootfs.sh

#Copy files to customize the ISO
cp packages.x86_64 ./releng/

cp splash.png ./releng/syslinux/

cp profiledef.sh ./releng/

cp -r usr ./releng/airootfs/

cp -r etc ./releng/airootfs/


echo "spark" > ./releng/airootfs/etc/hostname

#Set username, user password and root password
usr_name="live"
usr_pass="live"
root_pass="root"

#passwd
echo "${usr_name}:x:1010:1010::/home/${usr_name}:/bin/bash" >> ./releng/airootfs/etc/passwd

#group
echo "root::0:root
sys:x:3:${usr_name}
rfkill:x:983:${usr_name}
adm::4:${usr_name}
log:x:19:${usr_name}
lp:x:991:${usr_name}
network:x:90:${usr_name}
wheel::10:${usr_name}
${usr_name}::1010:" > ./releng/airootfs/etc/group

#shadow
usr_hash=$(openssl passwd -6 "${usr_pass}")
root_hash=$(openssl passwd -6 "${usr_pass}")
echo "root:${root_hash}:18517:0:99999:7:::
${usr_name}:${usr_hash}:18517:0:99999:7:::" > ./releng/airootfs/etc/shadow

#Set the keyboard layout
echo "KEYMAP=us" > ./releng/airootfs/etc/vconsole.conf

mkdir -p ./releng/airootfs/etc/X11/xorg.conf.d
echo "Section \"InputClass\"
        Identifier \"system-keyboard\"
        MatchIsKeyboard \"on\"
        Option \"XkbLayout\" \"us\"
        Option \"XkbModel\" \"pc104\"
EndSection" > ./releng/airootfs/etc/X11/xorg.conf.d/00-keyboard.conf

#Sudoers permission
chown -c root:root ./releng/airootfs/etc/sudoers
chmod -c 0440 ./releng/airootfs/etc/sudoers

#Locale
[[ -f ./releng/airootfs/etc/locale.conf ]] && rm ./releng/airootfs/etc/locale.conf
echo "LANG=en_US.UTF-8" > ./releng/airootfs/etc/locale.conf

echo "Generating updated mirrorlist..."
mkdir -p ./releng/airootfs/etc/pacman.d/
reflector --age 3 --protocol https --sort rate --save ./releng/airootfs/etc/pacman.d/mirrorlist

echo "Creating the ISO, this may take a while..."
mkarchiso -v ./releng
