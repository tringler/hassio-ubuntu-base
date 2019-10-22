#Downgrade to 16.04 --> https://forum.homegear.eu/t/varlibdpkginfohomegear-influxdbpostinst-line-31-insserv-command-not-found/3159
ARG BUILD_FROM=homeassistant/base-ubuntu:16.04
FROM ${BUILD_FROM}

# Homegear installation - https://homegear.eu/downloads.html
RUN \
    apt-get update && \
    apt-get install -y apt-transport-https && \
    curl https://apt.homegear.eu/Release.key | apt-key add - && \
    echo 'deb https://apt.homegear.eu/Ubuntu/ xenial/' > /etc/apt/sources.list.d/homegear.list && \
    \
    apt-get update && \
    apt-get install -y homegear homegear-management homegear-adminui homegear-nodes-core homegear-nodes-extra homegear-homematicbidcos \
        homegear-homematicwired homegear-insteon homegear-max homegear-philipshue homegear-sonos homegear-kodi \
        homegear-ipcam homegear-beckhoff homegear-knx homegear-enocean homegear-intertechno homegear-nanoleaf \
        homegear-ccu homegear-mbus homegear-influxdb && \
    apt-get clean && \
    rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/*

COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/bin/bash", "-c", "/run.sh"]


# Labels
LABEL \
    io.hass.name="Homegear" \
    io.hass.description="Homegear Add-On" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="https://github.com/tringler" \
    org.label-schema.description="Homegear Add-On" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Homegear" \
    org.label-schema.schema-version="0.1" \
    org.label-schema.url="https://github.com/tringler/hassio-addons/homegear/readme.md" \
    org.label-schema.usage="https://github.com/tringler/hassio-addons/homegear/readme.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/tringler/hassio-addons/homegear/" \
    org.label-schema.vendor="https://github.com/tringler"