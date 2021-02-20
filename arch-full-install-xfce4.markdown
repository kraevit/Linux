# Arch Linux Installation Guide ( MBR/Bios ) + XFCE4

### <a name="1-internet-configuration">1. Internet Configuration</a>

```bash
# ip a
# wifi-menu
# timedatectl set-ntp true
```

### <a name="2-disks">2. Disks</a>

#### a) Partitioning

! Partition Table Example

| BOOT | SWAP | ROOT | HOME |
| ---- | ---- | ---- | ---- |
| 300M | RAMx1.5 | 40G | 500G | 
| SDA1 | SDA2 | SDA3 | SDA4 |

```bash
# lsblk
# cfdisk /dev/sda
```

#### b) Formatting


mkfs.ext4 /path-to-root
mkswap /path-to-swap
swapon /path-to-swap

```bash
# mkfs.ext4 /dev/sda1
# mkswap /dev/sda2
# swapon /dev/sda2
# mkfs.ext4 /dev/sda3
# mkfs.ext4 /dev/sda4
```

#### c) Mounting

mount /path-to-root /mnt

```bash
# mount /dev/sda1 /mnt/boot
# mount /dev/sda3 /mnt
# mount /dev/sda4 /mnt/home

# lsblk
```

### <a name="3-base-install">3. Base Install</a>

! For AMD CPU's install ***amd-ucode*** microcode package
! For Intel CPU's install ***intel-ucode*** microcode package

```bash
# pacstrap /mnt base linux amd-ucode vim
# pacstrap /mnt base linux intel-ucode vim
```


### <a name="4-fstab-file">4. FSTAB File</a>

```bash
# genfstab -U /mnt >> /mnt/etc/fstab
# cat /mnt/etc/fstab
```

### <a name="5-enter-install">5. Enter Install</a>

```bash
# arch-chroot /mnt
```

### <a name="6-time-zone">6. Time Zone</a>

```bash
# ln -sf /usr/share/zoneinfo/Europe/Sofia /etc/localtime
# hwclock --systohc
```

### <a name="7-locales">7. Locales</a>

```bash
# vim /etc/locale.gen
```

! Uncomment #en_US.UTF-8 UTF-8

```bash
# locale-gen

# vim /etc/locale.conf
LANG=en_US.UTF-8
```

### <a name="8-hostname">8. Hostname</a>

```bash
# vim /etc/hostname
myhostname
example hostname: arch
```

### <a name="9-hosts-file">9. Hosts file</a>

```bash
# vim /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.0.1	arch.localdomain	arch
```

### <a name="10-root-password">10. Root Password</a>

```bash
# passwd
```

### <a name="11-boot-loader">11. Boot Loader</a>

```bash
# pacman -S networkmanager network-manager-applet dialog wireless_tools wpa_supplicant iputils os-prober mtools dosfstools base-devel linux-headers

# grub-install --target=i386-pc /dev/sda
# os-prober
# grub-mkconfig -o /boot/grub/grub.cfg
```

### <a name="12-exit-installer">12. Exit Installer</a>

```bash
# exit
```

### <a name="13-unmount">13. Unmount</a>

```bash
# umount -a
```

### <a name="14-reboot">14. Reboot</a> 

```bash
# reboot
```

### <a name="15-activate-internet">15. Activate Internet</a>

```bash
# systemctl start NetworkManager
# ip a
# nmtui
# systemctl enable NetworkManager
```

### <a name="16-new-user">16. New User</a>

```bash
# useradd -m -G wheel your-user-name
# passwd your-user-name

# EDITOR=vim visudo
```

\# Uncomment to allow members of group wheel to execute any command
\# %wheel ALL=(ALL) ALL


### <a name="17-graphics-driver">17. Graphics Driver</a>

```bash
# pacman -S xf86-video-intel /Intel Driver/
# pacman -S xf86-video-amdgpu /AMD Driver/
# pacman -S nvidia nvidia-utils /Nvidia Driver/
```

### <a name="18-display-server">18. Display Server</a>

```bash
# pacman -S xorg xorg-xinit
```

### <a name="19-display-manager">19. Display Manager</a>

\! IF no DM

```bash
# vim ~/.xinitrc
exec startxfce4
```

\! IF DM /install lxdm or lightdm/
```bash
# pacman -S lxdm
# systemctl enable lxdm.service
```

### <a name="20-desktop-install">20. Desktop Install</a>

```bash
# pacman -S xfce4 xfce4-goodies pulseaudio pavucontrol xdg-user-dirs
```

### <a name="21-fonts-configuration">21. Fonts Configuration</a>
[https://wiki.archlinux.org/index.php/Font_configuration#Fontconfig_configuration](https://wiki.archlinux.org/index.php/Font_configuration#Fontconfig_configuration)

```bash
# pacman -S noto-fonts
```

! Manually For LCD Screens

```bash
vim ~/.config/fontconfig/fonts.conf
```

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
  <fontconfig>
    <match target="font">
      <edit name="autohint" mode="assign">
        <bool>false</bool>
      </edit>
      <edit name="hinting" mode="assign">
        <bool>true</bool>
      </edit>
      <edit name="hintstyle" mode="assign">
        <const>hintslight</const>
      </edit>
      <edit name="rgba" mode="assign">
        <const>rgb</const>
      </edit>
      <edit name="lcdfilter" mode="assign">
        <const>lcddefault</const>
      </edit>
    </match>
    <match target="pattern">
      <edit name="dpi" mode="assign">
        <double>96</double>
      </edit>
    </match>
</fontconfig>
```

1. [Internet Configuration](#1-internet-configuration)
2. [Disks](#2-disks)
3. [Base Install](#3-base-install)
4. [FSTAB File](#4-fstab-file)
5. [Enter Install](#5-enter-install)
6. [Time Zone](#6-time-zone)
7. [Locales](#7-locales)
8. [Hostname](#8-hostname)
9. [Hosts file](#9-hosts-file)
10. [Root Password](#10-root-password)
11. [Boot Loader](#11-boot-loader)
12. [Exit Install](#12-exit-installer)
13. [Unmount](#13-unmount)
14. [Reboot](#14-reboot)
15. [Activate Internet](#15-activate-internet)
16. [New User](#16-new-user)
17. [Graphics Driver](#17-graphics-driver)
18. [Display Server](#18-display-server)
19. [Display Manager](#19-display-manager)
20. [Desktop Install](#20-desktop-install)
21. [Fonts Configuration](#21-fonts-configuration)
