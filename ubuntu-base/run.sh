#!/bin/bash

#Homegear installation - https://homegear.eu/downloads.html
apt update 
apt install -y apt-transport-https  
curl https://apt.homegear.eu/Release.key | apt-key add -  
echo 'deb https://apt.homegear.eu/Ubuntu/ xenial/' > /etc/apt/sources.list.d/homegear.list  

apt update  
apt install -y homegear homegear-management homegear-adminui homegear-nodes-core homegear-nodes-extra homegear-homematicbidcos \
    homegear-homematicwired homegear-insteon homegear-max homegear-philipshue homegear-sonos homegear-kodi \
    homegear-ipcam homegear-beckhoff homegear-knx homegear-enocean homegear-intertechno homegear-nanoleaf \
    homegear-ccu homegear-mbus homegear-influxdb

#mkdir -p /config/homegear
#mkdir -p /config/homegear/config
#mkdir -p /config/homegear/data
#mkdir -p /config/homegear/log

#echo "[INFO] Start Homegear"
#service homegear start
#service homegear-management start
#service homegear-influxdb start
tail -f /dev/null