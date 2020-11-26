#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="Spark-KDE"
iso_label="SPARK_KDE_$(date +%Y%m)"
iso_publisher="SPARK Linux <https://github.com/Sparklytical/Arch-calamares-installer>"
iso_application="SPARK DVD"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
