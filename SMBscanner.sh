#!/bin/bash

clear

file=
IFS=$'\n'

echo 'This script making automatically scanning SMB port to exploit'
sleep 5
clear
 echo 'Locate a FULL path to file:'
  read file
  file="$file"
  echo "File Included!"
  sleep 1
cat "$file" > /root/TEMP.txt
echo "IP Imported!"
sleep 1
chmod 777 /root/TEMP.txt
echo "chmod 777!"
sleep 1
echo "run" > /root/q.txt
echo "run command added!"
sleep 1
touch /root/run.rc
echo "Creating .rc file to metasploit"
sleep 2
echo "use auxiliary/scanner/smb/smb_ms17_010" >> /root/run.rc
echo "Added scanner"
sleep 1
echo
for var in $(cat $file)
do
echo set RHOSTS "$var" >> /root/run.rc
echo run >> /root/run.rc
done
echo "Removing temp files"
rm /root/TEMP.txt
echo " /root/TEMP.txt"
rm /q.txt
echo " /root/q.txt"
echo "IP added to scan! & ready to Scanning!"
sleep 2
echo
clear
echo "***************************"
echo "*                         *"
echo "*       Start MSF         *"
echo "*                         *"
echo "***************************"
service postgresql start && msfdb start
echo "DB started!"
msfconsole -r /root/run.rc
exit 0
# Made by Kallibr44
