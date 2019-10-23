#!/bin/bash

echo "[INFO] Start Homegear"
service homegear start
service homegear-management start
service homegear-influxdb start
tail -f /var/log/homegear/homegear.log