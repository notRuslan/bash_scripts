#!/usr/bin/env bash

# Services to check list
SERVICES=('mysql' 'nginx' 'php-fpm')
#check every DELAY time
DELAY=60
# Contact email
EMAIL="info@example.com"

# Hostname (automatic)
HOST=$HOSTNAME

# Subject
STATUS="Service-Status {$HOSTNAME}"



# Check processes
while true
    do
    for SERVICE in "${SERVICES[@]}"; do
            var=`ps -eaf | grep ${SERVICE} | grep -v grep | wc -l`

            if [ "$var" -lt "1" ]; then
                    service ${SERVICE} restart

                    if [ "$var" -lt "1" ]; then
                            echo "${HOST}: ${SERVICE} could not be restarted!" | mail -s "$STATUS" $EMAIL
                    else
                            echo "${HOST}: ${SERVICE} restarted successfully." | mail -s "$STATUS" $EMAIL
                    fi
            else
                    echo "${SERVICE} is  running."
            fi

    done
    sleep $DELAY
done