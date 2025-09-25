@echo off
echo Shapeshifter-dispatcher (Obfsproxy) for 64-bit Windows 
echo Starting transport SHADOW. Leave this windows(s) open.
echo ===
echo ===
echo ***
echo ***

shapeshifter-dispatcher.exe  -client -mode socks5  -state state -transports shadow -proxylistenaddr 127.0.0.1:999 -optionsFile shadow.json -logLevel DEBUG -enableLogging
pause