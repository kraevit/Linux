# horrow's Arch Linux Installation Guide 2019 

// comment
# command

// Verify the boot mode

# ls /sys/firmware/efi/efivars

// Connect to the internet

# ip link
# ping archlinux.org

// Update the system clock

timedatectl set-ntp true

// Partition the disk

# lsblk
# cfdisk /dev/sda

// Partition table

BOOT  SWAP     ROOT  HOME
300M  RAMx1.5  40G   500G

// Once the partitions have been created
// Format the parititons

# lsblk
# mkfs.ext4 /dev/sdx1
# mkswap /dev/sdx2
# swapon /dev/sdx2

// Mount the file systems

# mount /dev/sdx1 /mnt/boot
// SWAP no need to mount
# mount /dev/sdx3 /mnt
# mount /dev/sdx4 /mnt/home

// Installation
# pacstrap /mnt base linux linux-firmware

// Configure the system
// Generate an FSTAB file use -U

# genfstab -U /mnt >> /mnt/etc/fstab
# cat /mnt/etc/fstab

// Switch from USB drive into the new system
// Jump to installed arch linux

# arch-chroot /mnt

// Set the Time Zone

# ln -sf /usr/share/zoneinfo/Europe/Sofia /etc/localtime

// Generate /etc/adjtime

# hwclock --systohc 

// Localization
// Uncomment en_US.UTF-8 and other locales in /etc/locale.gen

# vim /etc/locale.gen
# locale-gen

// Set LANG variable in /etc/locale.conf

# vim /etc/locale.conf
LANG=en_US.UTF-8

// Set the keyboard layout and make changes persistent in vconsole.conf(5):

# vim /etc/vconsole.conf
KEYMAP=de-Latin1

// Network configuration

// Create hostname file:

# vim /etc/hostname
myhostname

// Add matching entries to hosts(5):

# vim /etc/hosts
127.0.0.1   localhost
::1         localhost
127.0.0.1   myhostname.localdomain myhostname

// Complete the network configuration for the newly installed environment, that includes installing packages such as "iputils" and your preferred network management software.

// Install "iputils" and network manager

# pacman -S networkmanager

// Enable network manager to autostart with systemd

# systemctl enable NetworkManager

// Install GRUB boot loader

# pacman -S grub

# grub-install /dev/sdx  (if only one hard drive /dev/sda)
# grub-install --target=i386-pc /dev/sdx1

// Install os-prober to find all Operating systems

# pacman -S os-prober
# os-prober
# grub-mkconfig -o /boot/grub/grub.cfg

// Set Root password

# passwd

// Return to USB drive

# exit
# umount -R /mnt
# lsblk
# reboot
