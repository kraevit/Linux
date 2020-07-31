# Setup Apache Virtual Hosts

"sudo" Omitted for Clarity

### 1. Create Linux User Accounts

```bash
adduser -m userA
adduser -m userB
```

### 2. Create user directory

```bash
mkdir /home/userA/public_html
mkdir /home/userB/public_html
```

### 3. Create "index.html" Files

```bash
vim /home/userA/public_html/index.html
vim /home/userB/public_html/index.html
```

### 4. Go to "apache2" Directory

```bash
cd /etc/apache2/sites-available/
```

### 5. Find and Copy Config File Named "000-default.confs" for the 2 Users

```bash
cp 000-default.confs userA.conf
cp 000-default.confs userB.conf
```

### 6. Edit Conf Files (Examples)

```bash
vim userA.conf
vim userB.conf
```

Example begining of the file!!! NOTE PORT

```apache
<VirtualHost *:80>
```

### 7. Change DocumentRoot

```apache
DocumentRoot  /home/userA/public_html/
DocumentRoot  /home/userB/public_html/
```

### 8. Add ServerName

```apache
ServerName  userA.com
ServerAlias www.userA.com
```

```apache
ServerName  userB.com
ServerAlias www.userB.com
```

### 9. Add <Directory> below DocumentRoot

```apache
<Directory /home/userA/public_html/>
  Options Indexes FollowSymLinks
  AllowOverride all (Allows .htaccess to Override Default Apache Conf on a Directory Bases)
  Require all granted
</Directory>
```

```apache
<Directory /home/userB/public_html/>
  Options Indexes FollowSymLinks
  AllowOverride all (Allows .htaccess to Override Default Apache Conf on a Directory Bases)
  Require all granted
</Directory>
```

### 10. Enable Both Sites

```bash
sudo a2ensite userA.conf
sudo a2ensite userB.conf
```

### 11. Restart apache2 Service

```bash
systemctl reload apache2
```

### 12. Modify hosts File

127.0.0.1 userA.com
127.0.0.1 userB.com
