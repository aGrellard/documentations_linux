#!/bin/bash
tcpdump -i any 'icmp and (icmp[icmptype]=8 or icmp[icmptype]=0)'
