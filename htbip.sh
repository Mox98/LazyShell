#Gets IP of Hackthebox VPN
#!/bin/bash
/sbin/ifconfig tun0 | grep "10.10." | awk '{print $2}'
