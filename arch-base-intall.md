# ArchLinux base intallation

### 1. Verify the boot mode

```bash
ls /sys/firmware/efi/efivars
```

### 2. Connect to the internet

```bash
ip link
ping archlinux.org
```

### 3. Update the system clock

```bash
timedatectl set-ntp true
```

### 4. Partition the disk

```bash
lsblk
cfdisk /dev/sda
```
// Example table

| BOOT | SWAP | ROOT | HOME |
| ---- | ---- | ---- | ---- |
| 300M | RAMx1.5 | 40G | 500G |

### 4.1 Format the partitions

```bash
lsblk
mkfs.ext4 /dev/sdx1
mkswap /dev/sdx2
swapon /dev/sdx2
```

### 4.2 Mount the partitions

```bash
mount /dev/sdx1 /mnt/boot
mount /dev/sdx3 /mnt
mount /dev/sdx4 /mnt/home
! SWAP DOESNT HAVE TO BE MOUNTED!
```

### 5. Base installtion

```bash
pacstrap /mnt base linux linux-firmware
```

### 6. FSTAB File(for partitons) use -U

```bash
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

### 7. SWITCH From USB drive to new Install

```bash
arch-chroot /mnt
```

### 8. Time Zone

```bash
ln -sf /usr/share/zoneinfo/Europe/Sofia /etc/localtime
```

### 9. Set hardware clock from system clock

```bash
hwclock --show
hwclock --systohc 
timedatectl
```

### 10. Localization (Uncomment en_US.UTF-8 and/or other locales in /etc/locale.gen)

```bash
vim /etc/locale.gen
locale-gen
```

### 11. Setting the system locale

```bash
im /etc/locale.conf
LANG=en_US.UTF-8
```

### 12. Set the keyboard layout persistent

```bash
vim /etc/vconsole.conf
KEYMAP=de-Latin1
```

### 13. Network Configuration

### 13.1 Hostname

```bash
vim /etc/hostname
myhostname
```

### 13.2 Add matching entries to hosts file

```bash
vim /etc/hosts
127.0.0.1   localhost
::1         localhost
127.0.0.1   myhostname.localdomain myhostname
```

### 13.3 Install "iputils" package and network manager

```bash
pacman -S iputils networkmanager
systemctl enable NetworkManager
```

### 14. GRUB Boot Loader

```bash
pacman -S grub
grub-install /dev/sdx  (if only one hard drive /dev/sda)
grub-install --target=i386-pc /dev/sdx1
```

### 15. Install os-prober to find all Operating systems

```bash
pacman -S os-prober
os-prober
grub-mkconfig -o /boot/grub/grub.cfg
```

### 16. Set root password

```bash
passwd
```

### 17. Return to USB drive

```bash
exit
umount -R /mnt
lsblk
reboot
```

