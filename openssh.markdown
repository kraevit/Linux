# OpenSSH

### Installation

```bash
sudo apt install openssh-server
```

### Config File

```bash
vim /etc/ssh/sshd_config
```

### Firewall

```bash
sudo apt install ufw
sudo ufw enable
sudo ufw allow 22/tcp
```

### On Windows

Install "putty"

### On Linux

Connect to the server using ssh command:

```bash
ssh username@server-ip-address
```
