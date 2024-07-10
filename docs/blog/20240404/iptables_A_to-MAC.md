# Régle iptables

## analyse avec tcpduump

```bash
sudo tcpdump -i eth0 -e port 80 
```

```bash
14:16:14.826568 8e:af:ae:d4:d2:30 (oui Unknown) > e4:5f:01:6e:a1:9f (oui Unknown), ethertype IPv4 (0x0800), length 66: 192.168.0.181.59098 > 192.168.0.35.http: Flags [.], ack 1405, win 110, options [nop,nop,TS val 2712307686 ecr 4092940861], length 0
```
ajouté une règle pour accepter le trafic sur le port 80 pour une adresse MAC spécifique avec :

```bash
sudo iptables -A INPUT -p tcp --dport 80 -m mac --mac-source xx:xx:xx:xx:xx:xx -j ACCEPT
```

la supprimer en utilisant :

```bash
sudo iptables -D INPUT -p tcp --dport 80 -m mac --mac-source xx:xx:xx:xx:xx:xx -j ACCEPT
```
