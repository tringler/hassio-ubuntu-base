![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

![Homegear Forum][forum-shield]

# Homegear Hass.io Add-on:
Homegear documentation: https://doc.homegear.eu/overview/

Homegear forum: https://forum.homegear.eu/

## About

Homegear is a software which acts as a hub for multiple protocols like HomeMatic or Z-Wave.
Currently these protocols are supported:

* HomeMaticBidCoS
* HomeMatic Wired
* Philips hue
* Z-Wave
* Intertechno
* KNX
* M-Bus
* Nanoleaf
* Sonos

## To Do / Known Issues

* SSL is not implemented (must be configured by `/config/homegear/config`)
* Authentication is not implemented (must be configured by `/config/homegear/config`)
* Ingress not implemented
* Database are not copied to `/config/homegear/data` at startup
* Data & config are only copied at startup, not at shutdown  

## Installation

Add https://github.com/tringler/hassio-homegear to your Hass.io add-on repositories.
Install the "Homegear" add-on. This process can take up to 10 minutes depending on your hardware.
Start the "Homegear" add-on.
Open the Web UI in order to open the Homegear Admin UI to configure your devices.

### First start & Migration
* All data in `/config/homegear/config` will applied to `/etc/homegear` before homegear is started.
* All data in `/config/homegear/data` will applied to `/var/lib/homegear` before homegear is started.

If you migrate an existing Homegear installation you need just to create the folders `/config/homegear/config` and `/config/homegear/data`
and migrate your data from `/etc/homegear` to `/config/homegear/config` and `/var/lib/homegear` to `/config/homegear/data` BEFORE you start the addon.

Otherwise `/config/homegear/config` and `/config/homegear/data` will be populated with Homegear default data after the first start.

## Configuration

### Option: `ssl`

Not implemented yet.

### Option: `devices`

You need to add the interface you are using to communicate i.e. by HomeMaticBidCoS.
On Hass.io navigate to Hass.io --> System and click on hardware to get the right name. (i.e. ttyUSB0)

## Homegear HomeAssistant configuration

Example HomeMatic BidCoS configuration:

```yaml

homematic:
  interfaces:
    rf:
      host: 127.0.0.1
      port: 2001
      resolvenames: metadata

```


[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://forum.homegear.eu/
