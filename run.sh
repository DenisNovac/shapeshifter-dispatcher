
# generate new config pairs
./shapeshifter-dispatcher -generateConfig -transport Shadow -serverIP 192.168.1.7:20001

# when changing transports
# change options file accrodingly

# the only way i was able to run it with openvpn is socks 5 mode
./shapeshifter-dispatcher -server -mode socks5 -state state -target 127.0.0.1:443 -transports Shadow -bindaddr Shadow-127.0.0.1:20001 -optionsFile ShadowServerConfig.json -logLevel DEBUG -enableLogging


# same with replicant:


./shapeshifter-dispatcher -polish -toneburst -generateConfig -transport Replicant -serverIP 192.168.1.7:20001

./shapeshifter-dispatcher -server -mode socks5 -state state -target 127.0.0.1:443 -transports Replicant -bindaddr Replicant-127.0.0.1:20001 -optionsFile ReplicantServerConfig.json -logLevel DEBUG -enableLogging


# debug inside docker

/usr/bin/shapeshifter-dispatcher -server -mode socks5 -state state -target vpn:443 -transports Replicant -bindaddr Replicant-0.0.0.0:20001 -optionsFile /proxy-certs/ReplicantServerConfig.json -logLevel DEBUG -enableLogging

/usr/bin/shapeshifter-dispatcher -server -mode socks5 -state state -target vpn:443 -transports Shadow -bindaddr Shadow-0.0.0.0:20001 -optionsFile /proxy-certs/ShadowServerConfig.json -logLevel DEBUG -enableLogging

/usr/bin/shapeshifter-dispatcher -generateConfig -transport Shadow -serverIP 192.168.1.7:20001





# local testing:

rm -rf ./states

./shapeshifter-dispatcher -generateConfig -transport shadow -serverIP 127.0.0.1:20001

# dummy target server on port 3333
nc -l 3333

# proxy server
./shapeshifter-dispatcher -transparent -server -state states/server -target 127.0.0.1:3333 -transports shadow -bindaddr shadow-127.0.0.1:20001 -optionsFile ShadowServerConfig.json -logLevel DEBUG -enableLogging

# proxy client
./shapeshifter-dispatcher -transparent -client -state states/client -transports shadow -proxylistenaddr 127.0.0.1:4444 -optionsFile ShadowClientConfig.json -logLevel DEBUG -enableLogging

# dummy client
telnet 127.0.0.1 4444

# some other usable stuff

# to check listened ports:
ss -tuln | grep tcp

# to check machine ip
ip -c a | grep inet

# to setup ubuntu firewall
ufw allow ssh
ufw default allow outgoing
ufw default deny incoming
ufw allow 443
ufw allow 20000

ufw enable
ufw reload

ufw deny 20000
ufw reload

ufw status verbose

# specific ports doesn't need to be allowed, docker allows himself

# ufw allow 20001
# ufw allow 20000


# ufw allow out 20001

ufw status numbered

# disable rule with 20000 after vpn setup to prohibit admin ui usage
# ufw delete N 