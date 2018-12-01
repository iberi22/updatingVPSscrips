ONFIGURACIÓN ADM-ULTIMATE
- SQUID, DROPBEAR, OPENVPN, SSL, PROXY SOCK Python Y BADVPN

Herramientas usadas:
Juice SSH(Playstore)

Puertos:
- OPENSSH DEFAULT (22)
- DROPBEAR (443, 53)
- SQUID o SQUID3 (80, 3128)
- PROXY SOCK-PYTHON (8080)
- OpenVPN TCP (1194)
- BAD UDP (7300)
- SSL *()local port 443 y en listen 442


NOTA: OLVIDE AGREGAR SSL igual mismo procedimiento, menú de instalación y seleccionan SSL opción 4.
Agregan y ponen en local port 443 y en listen 442 o 80 o 8080 dependiendo como lo usen.

#Antes de instalar el TCP OVER PROXY SOCK, vayan a los comandos y escriben reboot, vuelvan a ingresar al servidor y ya activan esa opción para evitar problemas. Otra manera de instalar el sock desde menú de instalación opción 6 y usar python1 (no usar python3).
# Squid 4.4 Repo for Ubuntu 18 no sirve para ubunros posteriores
# add diladele apt key
wget -qO - http://packages.diladele.com/diladele_pub.asc | sudo apt-key add -

# add repo
echo "deb http://squid44.diladele.com/ubuntu/ bionic main" > /etc/apt/sources.list.d/squid44.diladele.com.list

# update the apt cache
apt-get update

# install
apt-get install squid-common &&  apt-get install squid && apt-get install squidclient
:::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::comando de instalacion de squid manual::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::
1.Install the Squid3 package:



2.Edit the Squid configuration file /etc/squid3/squid.conf and replace:

#cache_dir ufs /var/spool/squid3 100 16 256

with:

cache_dir ufs /var/spool/squid3 5000 16 256 max-size=200000000

details_hoverNOTE

5000 is cache size in MB.

3.Stop the squid3 service.

sudo service squid3 stop
sudo squid3 –z

4.Edit the Squid configuration file again and add http_access allow all before http_access deny all to allow all clients to access the proxy.

5.Restart the squid3 service:

sudo service squid3 restart
:::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::: esta es la configuracion de squid que hice

acl url1 url_regex -i 127.0.0.1
acl url2 url_regex -i localhost
acl url3 url_regex -i (IP de tu server)
http_access allow url1
http_access allow url2
http_access allow url3
http_access deny all
http_port 8080
http_port 80
http_port 3128
http_port 3128
forwarded_for off
via off
# NOMBRE DEL SERVIDOR
visible_hostname VPS_TEST_s4m@beri
# ACL de mi ip
acl accept src (IP de tu server)
acl ip url_regex -i (IP de tu server)
# CACHE CONFIGURACIONTEST1 SQUID4.4
#cache deny all :::.disable cache UNCOMEND#
cache_mem 2400 MB
memory_cache_mode always
maximum_object_size_in_memory 32 KB
maximum_object_size 1024 MB
minimum_object_size 0 KB
cache_swap_low 70
cache_swap_high 75
cache_dir ufs /var/spool/squid 5000 16 256 max-size=200000000
access_log /var/log/squid/access.log squid





::::::CCOMANDOS::::


:::::SSHD_config para entrar por winscp

PermitRootLogin yes
PasswordAuthentication yes


sed -e '/PermitRootLogin/,/PasswordAuthentication/' /etc/ssh/sshd_config
sed -e '/PermitRootL/,/PasswordAut/ s/^#*/#/' -i /etc/ssh/sshd_config

sed -i '/![^#]/ s/\(^.*BBB.*$\)/#\1/'

Port 22
Port 53
Port 80
Port 443
Port 8080
Port 8484
service ssh reload


::::::.dropbeAR CONFI /etc/init.d/ssh restart
# disabled because OpenSSH is installed
# change to NO_START=0 to enable Dropbear
NO_START=0
# the TCP port that Dropbear listens on
DROPBEAR_PORT=22

# any additional arguments for Dropbear
DROPBEAR_EXTRA_ARGS="-p 53 -p 80 -p 443 -p 8080 -p 8084"

# specify an optional banner file containing a message to be
# sent to clients before they connect, such as "/etc/issue.net"
DROPBEAR_BANNER=""

# RSA hostkey file (default: /etc/dropbear/dropbear_rsa_host_key)
#DROPBEAR_RSAKEY="/etc/dropbear/dropbear_rsa_host_key"

# DSS hostkey file (default: /etc/dropbear/dropbear_dss_host_key)
#DROPBEAR_DSSKEY="/etc/dropbear/dropbear_dss_host_key"

# ECDSA hostkey file (default: /etc/dropbear/dropbear_ecdsa_host_key)
#DROPBEAR_ECDSAKEY="/etc/dropbear/dropbear_ecdsa_host_key"

# Receive window size - this is a tradeoff between memory and
# network performance
DROPBEAR_RECEIVE_WINDOW=65536

:::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::
apt-get update && apt-get upgrade && wget https://raw.githubusercontent.com/rizal180499/Auto-Installer-VPS/master/debian7-32.sh && chmod +x debian7-32.sh  && ./debian7-32.sh
-------
tunel


 https://raw.githubusercontent.com/Guilhermezkz/sslmanager/master/sslmanager
apt-get update && apt-get upgrade && wget https://raw.githubusercontent.com/iberi22/updatingVPSscrips/master/sslmanager && chmod +x sslmanager  && ./sslmanager
-------

Adm-manager-ultimate


https://www.dropbox.com/s/h4j9w3y52fv2gh7/instala.sh

apt-get update; apt-get upgrade -y; wget https://www.dropbox.com/s/h4j9w3y52fv2gh7/instala.sh && chmod +x ./instala.sh && ./instala.sh



@8:0??#8&@#5??#5&+21691262425
@8:0??#8&@#5??#5&+44989900955
@8:0??#8&@#5??#5&+2961718690
@8:0??#8&@#5??#5&+13263109931
@8:0??#8&@#5??#5&+14176402128
@8:0??#8&@#5??#5&+3718407838
@8:0??#8&@#5??#5&+8853117328
@8:0??#8&@#5??#5&+292648297
@8:0??#8&@#5??#5&+17914853450
@8:0??#8&@#5??#5&+24203580720
 v


@8:?&@#67@#&4?#5&+63034394295
@8:?&@#67@#&4?#5&+23878474292
Busacar
grep -r "iberi" /home/
:.............................................
::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
vpn config shadowshocks


apt-get update; apt-get upgrade -y; wget https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh && chmod +x ./install_server.sh && ./install_server.sh

To manage your Outline server, please copy the following line (including curly
brackets) into Step 2 of the Outline Manager interface:

{"apiUrl":"https://35.193.170.31:20152/WdXjp4g0NdIkaYQasZ16Cg","certSha256":"EFC6AC8C41332512E8F42C5B5                           5815A953F40B89A689D7FBA0A20A3F5F3FA1451"}

You won’t be able to access it externally, despite your server being correctly
set up, because there's a firewall (in this machine, your router or cloud
provider) that is preventing incoming connections to ports 20152 and 42001.

- If you plan to have a single access key to access your server, opening those
  ports for TCP and UDP should suffice.
- If you plan on adding additional access keys, you’ll have to open ports 1024
  through 65535 on your firewall since the Outline server may allocate any of
  those ports to new access keys.'

:::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::
verificar rootkit
apt-get install -y rkhunter
rkhunter —check
rkhunter -c




sudo apt-get install htop
Luego type htop

:::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SCRIPT PRA CONFIGURAR SSL

wget https://raw.githubusercontent.com/Guilhermezkz/sslmanager/master/sslmanager && bash sslmanager

Cria usuario

 wget https://raw.githubusercontent.com/Guilhermezkz/mytest/master/adduser && bash adduser

:::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::ANTIVIRUS-SERVER-SCAN:::::::::::::::::::::::::::::::::::::::::

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install clamav clamav-daemon -y
#::update the database
sudo freshclam

*To check all files on the computer, displaying the name of each file:

clamscan -r /
*To check all files on the computer, but only display infected files and ring a bell when found:

clamscan -r --bell -i /
*To scan all files on the computer but only display infected files when found and have this run in the background:

clamscan -r -i / &
*Note - Display background process's status by running the jobs command.

*To check files in the all users home directories:
clamscan -r /home

*To check files in the USER home directory and move infected files to another folder:
clamscan -r --move=/home/USER/VIRUS /home/USER

*To check files in the USER home directory and remove infected files (WARNING: Files are gone.):
clamscan -r --remove /home/USER

*To see more options:
clamscan --help