# HyperModem

Raspberry Pi + OpenWrt + Yggdrasil Network = **EPIC DECENTRALIZED MESH NETWORK**

## Features

* Truns your Raspberry Pi to an [Yggdrasil Network](https://yggdrasil-network.github.io) mesh node
* Supports 802.11s wireless mesh (if there is hardware support)
* Wireguard and GRE tunneling
* L2TP/PPPoE/PPTP support
* 3G/LTE USB dongles support
* IPv6 brokers support
* Dynamic DNS client

## How to install

Flash the downloaded firmware to the SD card (i.e. /dev/mmcblk0 or /dev/sdb):

```
gunzip -c openwrt-21.02.1-bcm27xx-bcm2711-rpi-4-ext4-factory.img.gz | sudo dd of=/dev/mmcblk0 bs=2M status=progress
```

## Usage

Connect Raspberry Pi to your home network and find an IP address of a device called `HyperModem` (it connects via DHCP).

Login to the web interface (i.e. http://192.168.1.100) and set the root password.

Configure physical links, install extra OpenWrt packages, do whatever you want with your own *HyperModem ™* mesh node.

## How to build

Install build dependencies:

```
sudo apt install build-essential libncurses5-dev libncursesw5-dev \
    zlib1g-dev gawk git gettext libssl-dev xsltproc rsync wget unzip python
```

Run the `build.sh` script with your parameters:

```
# Raspberry Pi 1
TARGET=bcm27xx SUBTARGET=bcm2708 PROFILE=rpi ./build.sh

# Raspberry Pi 2
TARGET=bcm27xx SUBTARGET=bcm2709 PROFILE=rpi-2 ./build.sh

# Raspberry Pi 3
TARGET=bcm27xx SUBTARGET=bcm2710 PROFILE=rpi-3 ./build.sh

# Raspberry Pi 4
TARGET=bcm27xx SUBTARGET=bcm2711 PROFILE=rpi-4 ./build.sh
```

If you want extra OpenWrt packages, specify them in the `EXTRA_PACKAGES` parameter.
Images also include custom files from the `files` directory.
