#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="ezarcher-gnome"
iso_label="EZARCHER-GNOME_$(date +%Y%m)"
iso_publisher="EZArcher Linux <https://sourceforge.net/projects/ezarch/>"
iso_application="EZArcher DVD"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
