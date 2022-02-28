if [ -f /etc/NetworkManager/system-connections/Personel.nmconnection ] ; then
rm /etc/NetworkManager/system-connections/Personel.nmconnection
else
echo ok
fi

if [ -f /etc/NetworkManager/system-connections/Personel_$SUDO_USER.nmconnection ] ; then
echo ok
else
#!/bin/sh
echo """
[connection]
id=Personel
uuid=2c99bb39-448c-4af9-98c6-e4f5e7504665
type=wifi
autoconnect=false
permissions=user:$SUDO_USER:;

[wifi]
mac-address-blacklist=
mode=infrastructure
ssid=Personel

[wifi-security]
key-mgmt=wpa-eap

[802-1x]
eap=peap;
identity=$SUDO_USER
password-flags=2
phase2-auth=mschapv2

[ipv4]
dns-search=
method=auto

[ipv6]
addr-gen-mode=stable-privacy
dns-search=
method=auto

[proxy]
""" > /etc/NetworkManager/system-connections/Personel_$SUDO_USER.nmconnection
chmod 600 /etc/NetworkManager/system-connections/Personel_$SUDO_USER.nmconnection
nmcli connection reload
fi


