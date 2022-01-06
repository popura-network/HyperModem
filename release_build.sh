#!/bin/bash
TARGET=ath79 SUBTARGET=generic PROFILE=tplink_archer-c7-v2 ./build.sh
TARGET=ath79 SUBTARGET=generic PROFILE=tplink_archer-c7-v4 ./build.sh
TARGET=ath79 SUBTARGET=generic PROFILE=tplink_archer-c7-v5 ./build.sh
TARGET=ath79 SUBTARGET=generic PROFILE=tplink_tl-wr1043n-v5 ./build.sh
TARGET=ath79 SUBTARGET=generic PROFILE=tplink_tl-wr1043nd-v4 ./build.sh
TARGET=bcm27xx SUBTARGET=bcm2708 PROFILE=rpi FILES="../files/rpi" ./build.sh
TARGET=bcm27xx SUBTARGET=bcm2709 PROFILE=rpi-2 FILES="../files/rpi" ./build.sh
TARGET=bcm27xx SUBTARGET=bcm2710 PROFILE=rpi-3 FILES="../files/rpi" ./build.sh
TARGET=bcm27xx SUBTARGET=bcm2711 PROFILE=rpi-4 FILES="../files/rpi" ./build.sh
TARGET=sunxi SUBTARGET=cortexa7 PROFILE=xunlong_orangepi-pc FILES="../files/rpi" ./build.sh
TARGET=sunxi SUBTARGET=cortexa7 PROFILE=xunlong_orangepi-zero FILES="../files/rpi" ./build.sh
TARGET=ramips SUBTARGET=mt7620 PROFILE=asus_rt-ac51u FILES="../files/asus_rt-ac51u" ./build.sh
TARGET=ramips SUBTARGET=mt7621 PROFILE=asus_rt-ac57u ./build.sh
TARGET=x86 SUBTARGET=64 PROFILE=generic ./build.sh

[ -d ./release ] || mkdir ./release

for ib_dir in openwrt-imagebuilder-*.Linux-x86_64; do
	cp -r $ib_dir/bin/targets ./release
done
