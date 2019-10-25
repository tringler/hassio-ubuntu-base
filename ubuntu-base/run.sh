#!/bin/bash
_term() {
    kill $(cat /var/run/homegear/homegear-management.pid)
    kill $(cat /var/run/homegear/homegear-webssh.pid)
    kill $(cat /var/run/homegear/homegear.pid)
    /etc/homegear/homegear-stop.sh
    exit $?
}

trap _term SIGTERM

mkdir -p /config/homegear/config
mkdir -p /config/homegear/data
mkdir -p /config/homegear/log

cp -Rn /etc/homegear/* /config/homegear/config
cp -Rn /var/lib/homegear/* /config/homegear/data

chown -R homegear:homegear /config/homegear/config
chown -R homegear:homegear /config/homegear/data


mv /main.conf /config/homegear/config/main.conf

touch /config/homegear/log/homegear.log

mkdir -p /var/run/homegear
chown homegear:homegear /var/run/homegear

/etc/homegear/homegear-start.sh

homegear -c /config/homegear/config -u homegear -g homegear -p /var/run/homegear/homegear.pid &
homegear-management -p /var/run/homegear/homegear-management.pid &
tail -f /config/homegear/log/homegear.log &
child=$!
wait "$child"