# /root/clamavscan.sh
#:!/bin/bash

LOGNAME="/var/log/clamav/clamav-$(date +'%m-%d-%Y').log";

DIRTOSCAN="/";

clamscan -r --remove "$DIRTOSCAN" -l "$LOGNAME";