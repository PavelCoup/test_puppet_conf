#! /bin/bash

/opt/minecraft/mcrcon -H localhost -P 2560 -p password say Server is shutting down in 15 seconds
/opt/minecraft/mcrcon -H localhost -P 2560 -p password save-all
sleep 15s
/opt/minecraft/mcrcon -H localhost -P 2560 -p password stop
sleep 10s
