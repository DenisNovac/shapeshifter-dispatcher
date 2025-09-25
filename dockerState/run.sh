#!/bin/bash


if [[ "$NEW_CERTS" == "true" ]]; then
  echo "Creating new certificates"
  cd /proxy-certs
  /usr/bin/shapeshifter-dispatcher -polish -toneburst -generateConfig -transport Replicant -serverIP $REAL_HOST_IP:$LISTEN_PORT
fi

cd /proxy-state

echo ""
echo "put it in your client config:"
cat /proxy-certs/ReplicantClientConfig.json
echo ""

echo "Starting proxy"

/usr/bin/shapeshifter-dispatcher -server -mode socks5 -target $TARGET_URL -transports Replicant -bindaddr Replicant-0.0.0.0:$LISTEN_PORT -optionsFile /proxy-certs/ReplicantServerConfig.json -logLevel DEBUG -enableLogging -state /proxy-state 


cat /proxy-state/dispatcher.log
echo "Dead"

# tail -f /dev/null # uncomment to not close the container