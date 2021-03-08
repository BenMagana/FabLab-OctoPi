# /root/ufw_log.sh

#!bin/bash

cur_line_count="$(wc -l /var/log/ufw.log)"

while true
do
        new_line_count="$(wc -l /var/log/ufw.log)"
        port=""
        if [ "$cur_line_count" != "$new_line_count" ]
        then
                block="$(tail -n 1 /var/log/ufw.log)"
                if [ $(tail -n 1 /var/log/ufw.log | grep -o DST=224.[0-9]*.[0-9]*.[0-9]*) ]
                then
                        #echo "$block was deleted"
                        sudo sed -i '$d' /var/log/ufw.log
                else
                        if [ $(tail -n 1 /var/log/ufw.log | grep -o DPT=[0-9]*) ]
                then
                        port="UFW Block Port ""$(tail -n 1 /var/log/ufw.log | grep -o DPT=[0-9]* | tr -d DPT=)"
                else
                        port="UFW Block"
                fi
                        #echo "$port"
                        #echo "$block"
                        echo "$block" | mail -s "$port" erick.palma-salazar@ngc.com
                fi

        fi
        cur_line_count="$new_line_count"
        sleep 1
done