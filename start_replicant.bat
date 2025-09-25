@echo off
echo Shapeshifter-dispatcher (Obfsproxy) for 64-bit Windows 
echo Starting transport REPLICANT. Leave this windows(s) open.
echo ===
echo ===
echo ***
echo ***

shapeshifter-dispatcher.exe  -client -mode socks5 -state state -transports replicant -proxylistenaddr 127.0.0.1:999 -optionsFile replicant.json -logLevel DEBUG -enableLogging
pause