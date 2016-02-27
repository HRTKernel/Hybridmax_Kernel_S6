#!/bin/bash
# Kernel Build Script by Hybridmax

# Vars
export KERNEL_DIR=$(pwd)
export BUILD_USER="$USER"
export TOOLCHAIN_DIR=/home/$BUILD_USER/android/toolchains/arm64
export CPU_JOB_NUM=`grep processor /proc/cpuinfo|wc -l`
export IMG=arch/arm64/boot
export BUILD_IMG=build_image
export KERNEL_DEFCONFIG=hybridmax-zerolte_defconfig
export DEVELOPER="Mystery"
export DEVICE="S6-Edge"
export VERSION_NUMBER="MM-"
export KERNELNAME="$DEVELOPER-$DEVICE-$VERSION_NUMBER"
export HYBRIDVER="-$KERNELNAME"

#########################################################################################
# Toolchains

#UBER
#BCC=$TOOLCHAIN_DIR/uber-aarch64-5.3/bin/aarch64-linux-android-
#BCC=$TOOLCHAIN_DIR/uber-aarch64-6.0/bin/aarch64-linux-android-

#SABERMOD
BCC=$TOOLCHAIN_DIR/sm-aarch64_5.3/bin/aarch64-

#########################################################################################
# Cleanup old Files

CLEANUP()
{
	clear
	echo "***********************************"
	echo "Cleaning Up..."
	echo "***********************************"
	echo

	make mrproper
	ccache -c
	rm -rf arch/arm64/boot/Image*.*
	rm -rf arch/arm64/boot/.Image*.*
	rm -f arch/arm/boot/*.dtb
	rm -f arch/arm/boot/*.cmd
}

#########################################################################################
# Compile Kernel Image

BUILD_KERNEL()
{
	echo "***********************************"
	echo "Starting Build..."
	echo "***********************************"
	echo

# Build_vars
	export ARCH=arm64
	export SUBARCH=arm64
	export USE_CCACHE=1
	export USE_SEC_FIPS_MODE=true
	export KCONFIG_NOTIMESTAMP=true
	export CROSS_COMPILE=$BCC
	export ENABLE_GRAPHITE=true
	make ARCH=arm64 $KERNEL_DEFCONFIG
	sed -i 's,CONFIG_LOCALVERSION="-Hybridmax",CONFIG_LOCALVERSION="'$HYBRIDVER'",' .config
	make ARCH=arm64 -j$CPU_JOB_NUM
}

#########################################################################################
# Image Check

IMAGE_CHECK()
{
if [ -f "arch/arm64/boot/Image" ]; then
	clear
	echo "***********************************"
	echo "Done, Compilation was successfull!"
	echo "***********************************"
else
	clear
	echo "***********************************"
	echo "Compilation failed!"
	echo "Please check build.log"
	echo "***********************************"
	echo
fi
}

#########################################################################################
# Create Log File of Compiled Image

rm -rf ./build.log
(
	START_TIME=`date +%s`
	CLEANUP
	BUILD_KERNEL
	IMAGE_CHECK
	END_TIME=`date +%s`
	let "ELAPSED_TIME=$END_TIME-$START_TIME"
	echo "Total compile time is $ELAPSED_TIME seconds"
) 2>&1	 | tee -a ./build.log

exit 1
