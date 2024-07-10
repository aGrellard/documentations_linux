# problemme avec iptables -A INPUT avec ufw

```bash
sudo iptables -A INPUT -p tcp --dport 22 -m mac --mac-source d8:cb:8a:9c:0c:ed -j ACCEPT         
```

# solution 1 : autoriser vi ip

`sudo ufw status verbose`

```bash
Status: active                                                                     
Logging: on (low)                                                                  
Default: deny (incoming), allow (outgoing), deny (routed)                          
New profiles: skip                                                                 
                                                                                   
To                         Action      From                                        
--                         ------      ----                                        
22                         ALLOW IN    192.168.0.35           
```

## résulta

`sudo iptables -L -v -n`

```bash
Chain INPUT (policy DROP 15 packets, 1224 bytes)
 pkts bytes target     prot opt in     out     source               destination         
23929  168M ufw-before-logging-input  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
23929  168M ufw-before-input  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
 3052  750K ufw-after-input  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
 2997  739K ufw-after-logging-input  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
 2997  739K ufw-reject-input  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
 2997  739K ufw-track-input  0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 DOCKER-USER  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 DOCKER-ISOLATION-STAGE-1  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 ACCEPT     0    --  *      docker0  0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
    0     0 DOCKER     0    --  *      docker0  0.0.0.0/0            0.0.0.0/0           
    0     0 ACCEPT     0    --  docker0 !docker0  0.0.0.0/0            0.0.0.0/0           
    0     0 ACCEPT     0    --  docker0 docker0  0.0.0.0/0            0.0.0.0/0           
    0     0 ACCEPT     0    --  *      br-4a7405979332  0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
    0     0 DOCKER     0    --  *      br-4a7405979332  0.0.0.0/0            0.0.0.0/0           
    0     0 ACCEPT     0    --  br-4a7405979332 !br-4a7405979332  0.0.0.0/0            0.0.0.0/0           
    0     0 ACCEPT     0    --  br-4a7405979332 br-4a7405979332  0.0.0.0/0            0.0.0.0/0           
    0     0 ufw-before-logging-forward  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 ufw-before-forward  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 ufw-after-forward  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 ufw-after-logging-forward  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 ufw-reject-forward  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 ufw-track-forward  0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 6 packets, 792 bytes)
 pkts bytes target     prot opt in     out     source               destination         
21168 4949K ufw-before-logging-output  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
21168 4949K ufw-before-output  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
 4203  407K ufw-after-output  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
 4203  407K ufw-after-logging-output  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
 4203  407K ufw-reject-output  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
 4203  407K ufw-track-output  0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain DOCKER (2 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain DOCKER-ISOLATION-STAGE-1 (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 DOCKER-ISOLATION-STAGE-2  0    --  docker0 !docker0  0.0.0.0/0            0.0.0.0/0           
    0     0 DOCKER-ISOLATION-STAGE-2  0    --  br-4a7405979332 !br-4a7405979332  0.0.0.0/0            0.0.0.0/0           
    0     0 RETURN     0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain DOCKER-ISOLATION-STAGE-2 (2 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 DROP       0    --  *      docker0  0.0.0.0/0            0.0.0.0/0           
    0     0 DROP       0    --  *      br-4a7405979332  0.0.0.0/0            0.0.0.0/0           
    0     0 RETURN     0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain DOCKER-USER (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 RETURN     0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-after-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-after-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    4   312 ufw-skip-to-policy-input  17   --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:137
    8  1922 ufw-skip-to-policy-input  17   --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:138
    0     0 ufw-skip-to-policy-input  6    --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:139
    0     0 ufw-skip-to-policy-input  6    --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:445
    3  1020 ufw-skip-to-policy-input  17   --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:67
    0     0 ufw-skip-to-policy-input  17   --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:68
    0     0 ufw-skip-to-policy-input  0    --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type BROADCAST

Chain ufw-after-logging-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        0    --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 10 LOG flags 0 level 4 prefix "[UFW BLOCK] "

Chain ufw-after-logging-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    4   564 LOG        0    --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 10 LOG flags 0 level 4 prefix "[UFW BLOCK] "

Chain ufw-after-logging-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-after-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-before-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
    0     0 ACCEPT     1    --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 3
    0     0 ACCEPT     1    --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 11
    0     0 ACCEPT     1    --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 12
    0     0 ACCEPT     1    --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 8
    0     0 ufw-user-forward  0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-before-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    1    62 ACCEPT     0    --  lo     *       0.0.0.0/0            0.0.0.0/0           
14989  160M ACCEPT     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
    0     0 ufw-logging-deny  0    --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
    0     0 DROP       0    --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
    0     0 ACCEPT     1    --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 3
    0     0 ACCEPT     1    --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 11
    0     0 ACCEPT     1    --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 12
    0     0 ACCEPT     1    --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 8
    3  1728 ACCEPT     17   --  *      *       0.0.0.0/0            0.0.0.0/0            udp spt:67 dpt:68
 1007  222K ufw-not-local  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
  975  217K ACCEPT     17   --  *      *       0.0.0.0/0            224.0.0.251          udp dpt:5353
    0     0 ACCEPT     17   --  *      *       0.0.0.0/0            239.255.255.250      udp dpt:1900
   32  4598 ufw-user-input  0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-before-logging-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-before-logging-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-before-logging-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-before-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    1    62 ACCEPT     0    --  *      lo      0.0.0.0/0            0.0.0.0/0           
13134 3923K ACCEPT     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
  622 43657 ufw-user-output  0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-logging-allow (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        0    --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 10 LOG flags 0 level 4 prefix "[UFW ALLOW] "

Chain ufw-logging-deny (2 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 RETURN     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID limit: avg 3/min burst 10
    0     0 LOG        0    --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 10 LOG flags 0 level 4 prefix "[UFW BLOCK] "

Chain ufw-not-local (1 references)
 pkts bytes target     prot opt in     out     source               destination         
   21  1656 RETURN     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type LOCAL
  975  217K RETURN     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type MULTICAST
   11  2942 RETURN     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type BROADCAST
    0     0 ufw-logging-deny  0    --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 10
    0     0 DROP       0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-reject-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-reject-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-reject-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-skip-to-policy-forward (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 DROP       0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-skip-to-policy-input (7 references)
 pkts bytes target     prot opt in     out     source               destination         
   15  3254 DROP       0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-skip-to-policy-output (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-track-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-track-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-track-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         
  312 18712 ACCEPT     6    --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate NEW
  304 24153 ACCEPT     17   --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate NEW

Chain ufw-user-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-user-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    2   120 ACCEPT     6    --  *      *       192.168.0.35         0.0.0.0/0            tcp dpt:22
    0     0 ACCEPT     17   --  *      *       192.168.0.35         0.0.0.0/0            udp dpt:22

Chain ufw-user-limit (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        0    --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 5 LOG flags 0 level 4 prefix "[UFW LIMIT BLOCK] "
    0     0 REJECT     0    --  *      *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-port-unreachable

Chain ufw-user-limit-accept (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-user-logging-forward (0 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-user-logging-input (0 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-user-logging-output (0 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-user-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         

```


