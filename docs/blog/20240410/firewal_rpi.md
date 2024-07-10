╭─adrien@debian ~ 
╰─$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp4s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
    link/ether d8:cb:8a:9c:0c:ed brd ff:ff:ff:ff:ff:ff
3: enx00e04c680cb7: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 00:e0:4c:68:0c:b7 brd ff:ff:ff:ff:ff:ff
4: wlp5s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether bc:f4:d4:0d:73:43 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.34/24 brd 192.168.1.255 scope global dynamic noprefixroute wlp5s0
       valid_lft 84114sec preferred_lft 84114sec
    inet6 fe80::652f:5676:25d7:fc2e/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
5: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:a2:1c:cb:31 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
6: br-4a7405979332: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:54:99:25:94 brd ff:ff:ff:ff:ff:ff
    inet 172.18.0.1/16 brd 172.18.255.255 scope global br-4a7405979332




╭─admin-rpi4@rpi-debian /media/usb_1T/Data/Programmation_code/_I1_LINUX/_C0_SCRIPTS_LINUX/docker_run/mkdocs-updated ‹main›                
╰─$ sudo iptables -L --line-numbers                                                                                                                                                                             
Chain INPUT (policy DROP)                                                                                    
num  target     prot opt source               destination                                                    
1    ufw-before-logging-input  all  --  anywhere             anywhere                                        
2    ufw-before-input  all  --  anywhere             anywhere                                                
3    ufw-after-input  all  --  anywhere             anywhere                                                 
4    ufw-after-logging-input  all  --  anywhere             anywhere                                         
5    ufw-reject-input  all  --  anywhere             anywhere                                                
6    ufw-track-input  all  --  anywhere             anywhere                                                 
7    ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:ssh MAC bc:f4:d4:0d:73:43         
8    ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:8096 MAC 08:c2:24:b0:fb:c5        
9    ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:8096 MAC bc:f4:d4:0d:73:43        
10   ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:8800 MAC bc:f4:d4:0d:73:43        
                                                                                                             
