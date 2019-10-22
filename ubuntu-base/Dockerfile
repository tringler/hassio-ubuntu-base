#Downgrade to 16.04 --> https://forum.homegear.eu/t/varlibdpkginfohomegear-influxdbpostinst-line-31-insserv-command-not-found/3159
ARG BUILD_FROM=homeassistant/base-ubuntu:16.04
FROM ${BUILD_FROM}

# Homegear installation - https://homegear.eu/downloads.html
COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/bin/bash", "-c", "/run.sh"]


# Labels
LABEL \
    io.hass.name="Ubuntu Base" \
    io.hass.description="Ubuntu Base Add-On" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="https://github.com/tringler" \
    org.label-schema.description="Ubuntu Base Add-On" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Ubuntu Base" \
    org.label-schema.schema-version="0.1" \
    org.label-schema.url="https://github.com/tringler/hassio-ubuntu-base" \
    org.label-schema.usage="https://github.com/tringler/hassio-ubuntu-base" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/tringler/hassio-ubuntu-base" \
    org.label-schema.vendor="https://github.com/tringler"