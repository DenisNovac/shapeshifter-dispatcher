

# generate new config pairs
./shapeshifter-dispatcher -generateConfig -transport Shadow -serverIP 192.168.1.7:20001
./shapeshifter-dispatcher -polish -toneburst -generateConfig -transport Replicant -serverIP 192.168.1.7:20001

# when changing transports
# change options file accrodingly

./shapeshifter-dispatcher -transparent -server -state state -target 127.0.0.1:443 -transports Shadow -bindaddr Shadow-0.0.0.0:20001 -optionsFile ShadowServerConfig.json -logLevel DEBUG -enableLogging


./shapeshifter-dispatcher -transparent -server -state state -target 127.0.0.1:443 -transports Replicant -bindaddr Replicant-0.0.0.0:20001 -optionsFile ReplicantServerConfig.json -logLevel DEBUG -enableLogging







# local testing:

rm -rf ./states

./shapeshifter-dispatcher -generateConfig -transport starbridge -serverIP 127.0.0.1:20001

# dummy target server on port 3333
nc -l 3333

# proxy server
./shapeshifter-dispatcher -transparent -server -state states/server -target 127.0.0.1:3333 -transports starbridge -bindaddr starbridge-127.0.0.1:20001 -optionsFile StarbridgeServerConfig.json -logLevel DEBUG -enableLogging

# proxy client
./shapeshifter-dispatcher -transparent -client -state states/client -transports starbridge -proxylistenaddr 127.0.0.1:4444 -optionsFile StarbridgeClientConfig.json -logLevel DEBUG -enableLogging

# dummy client
telnet 127.0.0.1 4444