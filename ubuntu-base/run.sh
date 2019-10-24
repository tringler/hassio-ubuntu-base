#!/bin/bash
_term() {
    kill $(cat /var/run/homegear/homegear-management.pid)
    kill $(cat /var/run/homegear/homegear-webssh.pid)
    kill $(cat /var/run/homegear/homegear.pid)
    /etc/homegear/homegear-stop.sh
    exit $?
}

trap _term SIGTERM


mkdir -p /var/run/homegear
chown homegear:homegear /var/run/homegear
/etc/homegear/homegear-start.sh
homegear -c /config/homegear/config -u homegear -g homegear -p /var/run/homegear/homegear.pid &
homegear-management -p /var/run/homegear/homegear-management.pid &
tail -f /config/log/homegear/homegear.log &
child=$!
wait "$child"