# Samba File Server

LINK: [Youtube](https://www.youtube.com/watch?v=RDwoDj2cW6c)

### 1. Enter hostname (Examples from Installation Process on Ubuntu Server .ISO)

Please enter the hostname for this system

Hostname:
ubuntu_______________

<Go Back>	<Continue>

!!!! Hit "Tab" and Select <Go Back> !!!!

### 2. Configure the Network Manually

Step 1: Instead of using DHCP Assign a Static IP address
Step 2: Go to the Router Settings and Exclude this IP From DHCP Pool

IP address example:

192.168.0.100/24  (/24 Represents the Subnet Mask E.G. 255.255.255.0)

Gateway:
____________

Name Server:
Should be the Same as Gateway

Hostname:
Server___________

Domain name:
Leave it blank/empty

### 3. Set Up Users

Full name for the new user:

Pesho Peshev

User name for your account:

horrow

Choose password for the new user:

password

Dont encrypt home folder

Partion disks

Configuring taskel

Install security updates automatically

Software selection

* OpenSSH server
* Lamp server
* Samba file server

<Continue>

Post Installation

Login

Install updates

sudo apt update -y && sudo apt upgrade -&

Restart

sudo reboot

Login Again

### 4. Samba Configuration

Create Linux Users Accounts

```bash
sudo adduser me
sudo adduser wife
sudo adduser kid
```bash

Do the Same on Samba  !!!! passwords Must be the Same !!!!

```bash
sudo smbpasswd -a me
sudo smbpasswd -a wife
sudo smbpasswd -a kid
```bash

### Create Directories for Sharing

```bash
sudo mkdir /Everybody
sudo mkdir /Everybody/Music
sudo mkdir /Everybody/Videos

sudo mkdir /MyStuff
sudo mkdir /WifeStuff
sudo mkdir /KidStuff
```

### Assign Permissions to the Directories

```bash
sudo chmod 777 /Everybody
sudo chmod 777 /Everybody/Music 
sudo chmod 777 /Everybody/Videos
sudo chmod 777 /MyStuff
sudo chmod 777 /WifeStuff
sudo chmod 777 /KidStuff
```

### Modify Samba Conf File

```bash
sudo vim /etc/samba/smb.conf
```bash

### Verify the Workgroup Shown

[global]

workgroup = WORKGROUP

Scroll Down to the Very Bottom of the File and Add the Following:

```samba
[Everybody]
 path = /Everybody
 browseable = yes
 read only = no
 valid users = kid me wife

[Music]
 path = /Everybody/Music
 browseable = yes
 read only = no
 valid users = kid me wife

[Videos]
 path = /Everybody/Videos
 browseable = yes
 read only = no
 valid users = kid me wife

[MyStuff]
 path = /MyStuff
 browseable = no
 read only = no
 valid users = me

[WifeStuff]
 path = /WifeStuff
 browseable = no
 read only = no
 valid users = wife

[KidStuff]
 path = /KidStuff
 browseable = no
 read only = no
 valid users = kid wife
```

### Test Conf File for Errors

```bash
testparm /etc/samba/smb.conf
```

### IMPROVE SECURITY

Prevent Login Access to the Server

```bash
sudo vim /etc/passwd
```

Go to the Bottom Lines and Change

```bash
me:x:1001:10001:,,,:/home/me:/bin/bash
wife:x:1002:10002:,,,:/home/wife:/bin/false
kid:x:1003:10003:,,,:/home/kid:/bin/false
```

### TEST Everything on Windows

Make Sure that the Network Discovery is Turned / ON

Thic PC->Network->(You should see Everybody, Music, Videos Folders)

### Windows `kid` Account

This PC->Network->Map Network Drive->Folder: \\192.168.0.100\KidStuff

[x] Reconnect at sign-in

### Windows `me` Account (Logout and Login as `me`)

This PC -> Network->Map Network Drive->Folder: \\192.168.0.100\MyStuff

### Windows `wife` Account (Logout and Login as `wife`)

This PC->Network->Map Network Drive->Folder: \\192.168.0.100\WifeStuff




### TEST Everything on Linux

How to Connect to Samba If You are Logged in With a User that is not Added to the Server?

Computer->Connect to Server

Server: 192.168.0.100
Type: Windows share
Folder /Everybody

Domain name: WORKGROUP
User name: me
Password: pass

[x] Remember this password

### Login from Another Linux Machine as `wife`

Computer->Connect to Server

Server: 192.168.0.100
Type: Windows share
Folder: /WifeStuff

Domain name: WORKGROUP
User name: wife
Password: pass

[x] Remember this password

Computer -> Connect to Server
Server: 192.168.0.100
Type: Windows share
Folder: /KidStuff

Domain name: WORKGROUP
User name: wife
Password: pass

[x] Remember this password

### Logout and Login as `kid`

Computer->Connect to Server

Server: 192.168.0.100
Type: Windows share
Folder: /KidStuff

Domain name: WORKGROUP
User name: kid
Password: pass

[x] Remember this password
