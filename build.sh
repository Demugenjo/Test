#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=$(pwd)/aarch64-linux-android-4.9/bin/aarch64-linux-android-

mkdir output

make -C $(pwd) O=output clean
make -C $(pwd) O=output mrproper
make -C $(pwd) O=output kali_defconfig
make -C $(pwd) O=output menuconfig 
make -j8 -C $(pwd) O=output CONFIG_NO_ERROR_ON_MISMATCH=y
cp output/arch/arm64/boot/Image.gz-dtb output/arch/arm64/boot/zImage
