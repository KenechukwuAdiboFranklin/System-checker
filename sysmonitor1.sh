#!/bin/bash

while true
do
echo "==============================="
echo "     SYSTEM DIAGNOSTICS MENU"
echo "==============================="
echo "1. Show Public IP"
echo "2. Show Private IP"
echo "3. Show Masked MAC Address"
echo "4. Top 5 CPU Processes"
echo "5. Memory Usage"
echo "6. Active Services"
echo "7. Top 10 Largest Files in /home"
echo "8. Exit"
echo "==============================="
read -p "Choose an option: " choice

case $choice in

1)
echo "Public IP:"
curl -s ifconfig.me
echo
;;

2)
echo "Private IP:"
hostname -I
;;

3)
echo "Masked MAC Address:"
ip link | grep "ether" | awk  '{print $2}' | sed 's/..:..:..$/XX:XX:XX/'
;;

4)
echo "Top 5 CPU Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
;;

5)
echo "Memory Usage:"
free -h | grep "Mem" | awk '{print "Total:", $2, "Available:", $7}'
;;

6)
echo "Active Services:"
systemctl list-units --type=service --state=running
;;

7)
echo "Top 10 Largest Files in /home:"
du -h /home 2>/dev/null | sort -rh | head -n 10
;;



8)
echo "Exiting..."
exit 0
;;

*)
echo "Invalid option!"
;;

esac

echo
read -p "Press Enter to continue..."
clear
done
