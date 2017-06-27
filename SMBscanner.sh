#!/bin/bash

clear

file=
IFS=$'\n'

echo 'This script making automatically scanning SMB port to exploit'
sleep 5
clear
echo "Finding Metasploit..."
if [-d /usr/share/metasploit-framework]
 then 
   echo "Metasploit found!"
 else
  echo "Metasploit not found!"
  sleep 1
  echo "Install Metasploit? [Y/n]"
  read q
    case "$q" in
   Y|y) echo "Do you have Kali repositories? [y/n]"
        read  qq
         case "$qq" in
           Y|y ) echo "Installing Metasploit..."
                 sudo apt install metasploit-framework -y		   
                 ;;
           N|n ) echo "Adding repositories"
                 apt-key adv —keyserver pgp.mit.edu —recv-keys ED444FF07D8D0BF6 && echo '# Kali linux repositories | Added by Katoolin\ndeb http://http.kali.org/kali kali-rolling main contrib non-free' » /etc/apt/sources.list		   
				 apt update && apt install metasploit-framework -y
                 ;;
         esac
   ;;
   N|n) clear 
        echo "This sript need Metasploit-framework. Exit..."
		exit 0
        ;;
   esac
   fi
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
