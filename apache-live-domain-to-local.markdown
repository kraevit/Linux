# How to Point a Domain Name to Local Server ?

Link: [YouTube](#https://www.youtube.com/watch?v=aPqDQX5naHA) 

Ubuntu Linux:

### 1. Set PORT 80 Forwarding Rule on the ROUTER

### 2. Edit hosts File

```bash
vim /etc/hosts

127.0.0.1	localhost
0.0.0.0		your-domain-name.com
0.0.0.0		www.your-domain-name.com
```

### 3. Create Conf File

```bash
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/your-domain-name.com.conf
vim /etc/apache2/sites-available/your-domain-name.com.conf
```

```apache
<VirtualHost your-domain-name:80>
	ServerName www.your-domain-name.com
	ServerName your-domain-name.com
	ServerAdmin your-email@gmail.com
    DocumentRoot /var/www/your-domain-name/public_html
```

FOr Setting UP Secondary Domain Name Do the Same as Above

```bash
a2ensite your-domain-name.com.conf
a2ensite secondary-domain-name.com.conf
mkdir /var/www/your-domain-name/public_html
cd /var/www/your-domain-name/puclic_html
touch index.html
service apache2 restart
```

# 4. Go to the Hosting Provider Panel /SuperHosting/

Manage Domains -> Domain Settings -> Manage DNS -> TYPE A NAME @ -> Enter 

Your Static IP Address
