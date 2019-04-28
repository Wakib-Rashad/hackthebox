```
# map 10.10.10.117 -Pn -n -sV -p6697,8067,65534 --script "irc-*backdoor*"

Starting Nmap 7.40 ( https://nmap.org ) at 2019-02-08 15:00 EST
Nmap scan report for 10.10.10.117
Host is up (0.083s latency).
PORT      STATE SERVICE VERSION
6697/tcp  open  irc     UnrealIRCd
8067/tcp  open  irc     UnrealIRCd
65534/tcp open  irc     UnrealIRCd (Admin email djmardov@irked.htb)
Service Info: Host: irked.htb

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 1.84 seconds
```
