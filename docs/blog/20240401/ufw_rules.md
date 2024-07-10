# ajouts des régles de pare-feu UFW sur raspberry pi

## régles pour wdd

```bash
#!/bin/bash

# Pour le port 5357 depuis n'importe quelle adresse IP
sudo ufw allow 5357/tcp

# Autorisation pour IPv6, si nécessaire (par exemple, pour le port 5357)
sudo ufw allow from any to any port 5357 proto tcp

# Pour le trafic multicast sur ff02::/16 pour les ports 1900 et 3702 depuis fe80::/10
sudo ufw allow from fe80::/10 to any port 1900 proto udp
sudo ufw allow from fe80::/10 to any port 3702 proto udp
```

## ssh
```bash
sudo ufw allow from 192.168.0.120 to any port 22             
```

## samba
```bash
sudo ufw allow from 192.168.0.120 to any app samba           
sudo ufw allow from 192.168.0.136 to any app samba           
```

```bash
cd /etc/ufw/applications.d/       

╭─adri-rpi@rpi4-debi12 /etc/ufw/applications.d                                                 
╰─$ ls                                                                                         
openssh-server  ufw-chat             ufw-fileserver   ufw-printserver                          
samba           ufw-directoryserver  ufw-loginserver  ufw-proxyserver                          
ufw-bittorent   ufw-dnsserver        ufw-mailserver   ufw-webserver 

╭─adri-rpi@rpi4-debi12 /etc/ufw/applications.d                                                 
╰─$ cat samba                                                                                  
[Samba]                                                                                        
title=LanManager-like file and printer server for Unix                                         
description=The Samba software suite is a collection of programs that implements the SMB/CIFS p
rotocol for unix systems, allowing you to serve files and printers to Windows, NT, OS/2 and DOS
 clients. This protocol is sometimes also referred to as the LanManager or NetBIOS protocol.   
ports=137,138/udp|139,445/tcp                                                                  
```