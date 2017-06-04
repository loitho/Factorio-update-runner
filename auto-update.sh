#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
export DISPLAY=:0.0

/opt/factorio-init/factorio update --dry-run | grep 'No new updates'
if [ $? == 0 ]
then
        echo "No new update"
        #/opt/factorio-init/factorio cmd "SERVER NO NEW UPDATE"
        logger "No new update for Factorio"
        exit 0;
else
        echo "new update"
        logger "updating Factorio"
        /opt/factorio-init/factorio cmd "SERVER WILL BE RESTARTED IN 1 MINUTE TO UPDATE TO NEW FACTORIO VERSION"
        sleep 50
        /opt/factorio-init/factorio cmd "SERVER RESTARTING IN 10 SECONDS GTFO"
        sleep 10
        /opt/factorio-init/factorio cmd "SERVER RESTARTING" && /opt/factorio-init/factorio update && /opt/factorio-init/factorio start
fi
