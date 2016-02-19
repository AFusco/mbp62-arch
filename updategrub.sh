#!/bin/bash

grub-mkconfig -o /boot/grub/grub.cfg
grub-mkstandalone -o boot.efi -d /usr/lib/grub/x86_64-efi -O x86_64-efi --compress=xz /boot/grub/grub.cfg
mount -t hfsplus -o force,rw /dev/sda4 /mnt
mv /mnt/System/Library/CoreServices/boot.efi /mnt/System/Library/CoreServices/boot.old
mv boot.efi /mnt/System/Library/CoreServices/boot.efi
umount /mnt
