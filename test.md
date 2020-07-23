1. Internet Configuration
2. Disks
  a) Partitioning
  b) Formatting
  c) Mounting
3. Base Install
4. FSTAB File
5. Enter Install
6. Time Zone
7. Locales
8. Hostname
9. Hosts file
10. Root Password
11. Boot Loader
12. Exit Install
13. Unmount
14. Reboot
15. Activate Internet
16. New User
17. Graphics Driver
18. Display Server
19. Display Manager
20. Desktop Install
21. Setup Fonts

==================

### 1. Internet Configuration

```bash
ip a
wifi-menu
timedatectl set-ntp true
```

### 2. Disks

#### a) Partitioning

! Partition Table Example

| BOOT | SWAP | ROOT | HOME |
| ---- | ---- | ---- | ---- |
| 300M | RAMx1.5 | 40G | 500G | 
| SDA1 | SDA2 | SDA3 | SDA4 |

```bash
lsblk
cfdisk /dev/sda
lsblk
```

#### b) Formatting

```bash
mkfs.ext4 /path-to-root
mkswap /path-to-swap
swapon /path-to-swap

mkfs.ext4 /dev/sdx1
mkswap /dev/sdx2
swapon /dev/sdx2
```

#### c) Mounting

```bash
mount /path-to-root /mnt

mount /dev/sdx1 /mnt/boot
// SWAP no need to mount /dev/sdx2
mount /dev/sdx3 /mnt
mount /dev/sdx4 /mnt/home

lsblk
```

### 3. Base Install

```bash
pacstrap /mnt base linux linux-firmware vim
```

### 4. FSTAB File

```bash
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

### 5. Enter Install

```bash
arch-chroot /mnt
```

### 6. Time Zone

```bash
ln -sf /usr/share/zoneinfo/Europe/Sofia /etc/localtime
hwclock --systohc
```

### 7. Locales

```bash
vim /etc/locale.gen
```

! Uncomment #en_US.UTF-8 UTF-8

```bash
locale-gen

vim /etc/locale.conf
LANG=en_US.UTF-8
```

### 8. Hostname

```bash
vim /etc/hostname
myhostname
example hostname: arch
```

### 9. Hosts file

```bash
vim /etc/hosts
127.0.0.1	localhost
::1			localhost
127.0.0.1	arch.localdomain	arch
```

### 10. Root Password

```bash
passwd
```

### 11. Boot Loader

```bash
pacman -S networkmanager network-manager-applet dialog wireless_tools wpa_supplicant iputils os-prober mtools dosfstools base-devel linux-headers

grub-install --target=i386-pc /dev/sda
os-prober
grub-mkconfig -o /boot/grub/grub.cfg

exit
```

### 13. Unmount

```bash
umount -a
```

### 14. Reboot 

```bash
reboot
```

### 15. Activate Internet

```bash
systemctl start NetworkManager
ip a
nmtui
systemctl enable NetworkManager
```

### 16. New User

```bash
useradd -m -G wheel your-user-name
passwd your-user-name

EDITOR=vim visudo

## Uncomment to allow members of group wheel to execute any command
# %wheel ALL=(ALL) ALL
```

### 17. Graphics Driver

```bash
pacman -S xf86-video-intel /Intel Driver/
pacman -S xf86-video-amdgpu /AMD Driver/
pacman -S nvidia nvidia-utils /Nvidia Driver/
```

### 18. Display Server

```bash
pacman -S xorg
```

### 19. Display Manager

! IF no DM

```bash
vim ~/.xinitrc
exec startxfce4
```

! IF DM /install lxdm or lightdm/
```bash
pacman -S lxdm
systemctl enable lxdm.service
```

### 20. Desktop Install

```bash
pacman -S xfce4 xfce4-goodies pulseaudio pavucontrol xdg-user-dirs
```

### 21. Setup Fonts
[https://wiki.archlinux.org/index.php/Font_configuration#Fontconfig_configuration](https://wiki.archlinux.org/index.php/Font_configuration#Fontconfig_configuration)

```bash
pacman -S noto-fonts
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
