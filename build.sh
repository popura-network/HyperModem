#!/bin/bash

TARGET=${TARGET:-"bcm27xx"} 
SUBTARGET=${SUBTARGET:-"bcm2711"}
PROFILE=${PROFILE:-"rpi-4"}
EXTRA_PACKAGES=${EXTRA_PACKAGES}
FILES=${FILES:-"../files/generic"}

OPENWRT_MIRROR=https://downloads.openwrt.org
OPENWRT_VERSION="21.02.1"
DEFAULT_PACKAGES="luci \
		luci-proto-ppp luci-proto-3g luci-proto-ncm luci-proto-qmi luci-proto-gre luci-proto-wireguard luci-proto-ipv6 \
		luci-app-yggdrasil luci-app-ddns \
		luci-i18n-base-ru luci-theme-openwrt-2020 \
	usb-modeswitch kmod-usb-wdm kmod-usb-net-cdc-ether umbim kmod-usb-net-cdc-mbim \
    wpad -wpad-basic-wolfssl \
	xl2tpd stubby drill getdns"
PACKAGES="$DEFAULT_PACKAGES $EXTRA_PACKAGES"

file_name=openwrt-imagebuilder-$OPENWRT_VERSION-$TARGET-$SUBTARGET.Linux-x86_64.tar.xz
builder_directory=openwrt-imagebuilder-$OPENWRT_VERSION-$TARGET-$SUBTARGET.Linux-x86_64

if [ ! -d $builder_directory ]; then
	echo "download and extract the builder"

	IMAGE_BUILDER_URL=$OPENWRT_MIRROR/releases/$OPENWRT_VERSION/targets/$TARGET/$SUBTARGET/$file_name
	wget $IMAGE_BUILDER_URL && tar xJf $file_name || exit 2
fi

cd $builder_directory
make image FILES="$FILES" PROFILE="$PROFILE" PACKAGES="$PACKAGES"

echo -e "\n\nSuccess! Your HyperModem firmware:\n"
ls $PWD/bin/targets/$TARGET/$SUBTARGET/*
