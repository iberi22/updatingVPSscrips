
cd
adduser beri
usermod -aG sudo beri

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local



sudo apt-get update && sudo apt-get -y upgrade
apt-get install squid3