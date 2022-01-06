# Popura HyperModem

<img src="https://raw.githubusercontent.com/popura-network/HyperModem/master/img/hypermodem.jpg">

Turn IoT devices into decentralized network nodes. 

**[Downloads](https://github.com/popura-network/HyperModem/releases)**

## Features

* Customizable firmware based on [OpenWrt](https://openwrt.org)
* Turns your device to an [Yggdrasil Network](https://yggdrasil-network.github.io) node
* Supports 802.11s wireless peer to peer connections (if there is hardware support)
* Wireguard and GRE tunneling
* L2TP/PPPoE/PPTP support
* 3G/LTE USB dongles support
* IPv6 brokers support
* Dynamic DNS client

Yggdrasil Network is a peer-to-peer IPv6 network with link-local peer discovery, automatic end-to-end encryption, distributed IP address allocation, and DHT-based routing information exchange.

## Supported devices

This firmware can be installed on any device supported by OpenWrt with at least 16MB flash size and 64MB RAM.

Support for 802.11s wireless peer to peer connections depends on a wireless driver. Most up to date open source drivers work (ath9k, mt76).

## Installation and usage

Search the OpenWrt website for detailed instructions for your device.

## How to build

Install build dependencies:

```
sudo apt install build-essential libncurses5-dev libncursesw5-dev \
    zlib1g-dev gawk git gettext libssl-dev xsltproc rsync wget unzip python
```

Run the `build.sh` script with your parameters:

```
# Raspberry Pi 1
TARGET=bcm27xx SUBTARGET=bcm2708 PROFILE=rpi FILES="../files/rpi" ./build.sh

# Raspberry Pi 2
TARGET=bcm27xx SUBTARGET=bcm2709 PROFILE=rpi-2 FILES="../files/rpi" ./build.sh

# Raspberry Pi 3
TARGET=bcm27xx SUBTARGET=bcm2710 PROFILE=rpi-3 FILES="../files/rpi" ./build.sh

# Raspberry Pi 4
TARGET=bcm27xx SUBTARGET=bcm2711 PROFILE=rpi-4 FILES="../files/rpi" ./build.sh
```

If you want extra OpenWrt packages, specify them in the `EXTRA_PACKAGES` parameter.
By default, images include custom files from the `files/generic` directory. Customize that path with the `FILES` parameter.

## Disclaimer

This project is Free (as in freedom) Software based on the stable OpenWrt firmware release.
*Use at your own risk.*
