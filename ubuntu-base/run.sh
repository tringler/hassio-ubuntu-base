#!/bin/bash
_term() {
    kill $(cat /var/run/homegear/homegear-management.pid)
    kill $(cat /var/run/homegear/homegear-webssh.pid)
    kill $(cat /var/run/homegear/homegear.pid)
    /etc/homegear/homegear-stop.sh
    exit $?
}

trap _term SIGTERM

cp -R /etc/homegear/* /config/homegear/config
mv /main.conf /config/homegear/config/main.conf
touch /config/homegear/log/homegear.log

mkdir -p /var/run/homegear
chown homegear:homegear /var/run/homegear
chown -R homegear:homegear /config/homegear/config
/etc/homegear/homegear-start.sh
homegear -c /config/homegear/config -u homegear -g homegear -p /var/run/homegear/homegear.pid &
homegear-management -p /var/run/homegear/homegear-management.pid &
tail -f /config/homegear/log/homegear.log &
child=$!
wait "$child"