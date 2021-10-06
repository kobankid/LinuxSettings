echo off
rem wsl -d Ubuntu-20.04 -- /usr/bin/genie -i
rem wsl -u root -- service ssh start
rem wsl -u root -- service ssh restart
wsl -d Ubuntu-20.04 exec hostname -I
wsl -d Ubuntu-20.04 exec hostname -I>"%CD%\wsl_ip.txt"
set /P IP=<"%CD%\wsl_ip.txt"
del "%CD%\wsl_ip.txt"
netsh.exe interface portproxy delete v4tov4 listenport=22
netsh.exe interface portproxy add    v4tov4 listenport=22 connectaddress=%IP%
wsl -u kobankid -- sudo systemctl start ssh.service
wsl -u kobankid -- sudo systemctl restart ssh.service
wsl -u root -- rm -rf /var/run/nologin /etc/run/nologin
rem set KOBANKID=%IP%
setx KOBANKID %IP%
echo Host IP address of wsl2 is below.
echo %IP%
echo Setting is success!!
set /p input=