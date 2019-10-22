#!/bin/bash

mkdir -p /config/homegear
mkdir -p /config/homegear/config
mkdir -p /config/homegear/data
mkdir -p /config/homegear/log

echo "[INFO] Start Homegear"
service homegear start
service homegear-management start
service homegear-influxdb start
tail -f /var/log/homegear/homegear.log