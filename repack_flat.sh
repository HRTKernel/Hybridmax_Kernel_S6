#!/bin/bash
# Kernel Repack Script by Hybridmax

# vars
export KERNEL_DIR=$(pwd)
export CURDATE=`date "+%Y.%m.%d"`
export IMG=arch/arm64/boot
export BUILD_IMG=build_image
export DTS=arch/arm64/boot/dts
export ZIP_DIR=zip_files
export MODULES_DIR=build_image/zip_files/system/lib/modules
export DEVELOPER="Mystery"
export DEVICE="S6"
export VERSION_NUMBER="MM-"
export HYBRIDVER="$DEVELOPER-Kernel-$DEVICE-$VERSION_NUMBER-($CURDATE)"
export KERNEL_NAME="$HYBRIDVER"

#########################################################################################
# Clean old zip & tar Files

rm -rf $BUILD_IMG/output_kernel/Mystery-Kernel-S6-MM-*.tar
rm -rf $BUILD_IMG/output_kernel/Mystery-Kernel-S6-MM-*.zip

#########################################################################################
# Copy Modules

echo "Copy Modules..........................."
echo
find -name '*.ko' -exec cp -av {} $MODULES_DIR \;
${CROSS_COMPILE}strip --strip-unneeded $MODULES_DIR/*

#########################################################################################
# DT.IMG Generation

#clear
#echo "**************************************"
#echo "Make DT.img..........................."
#echo
#./tools/dtbtool -o $BUILD_IMG/boot_flat/dt.img -s 2048 -p ./scripts/dtc/ $DTS/ | sleep 1

#########################################################################################
# Calculate DTS size

#du -k "$BUILD_IMG/boot/dt.img" | cut -f1 >sizT
#sizT=$(head -n 1 sizT)
#rm -rf sizT
#echo "dt.img: $sizT Kb"

#########################################################################################
# Ramdisk Generation

#echo "Make Ramdisk..........................."
#echo
#cd $BUILD_IMG/ramdisk
#find .| cpio -o -H newc | lzma -9 > ../ramdisk.cpio.gz

#########################################################################################
# Boot.img Generation

#echo "Make boot.img..........................."
#echo
#cd ..
#./mkbootimg --base 0x10000000 --kernel Image --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --#pagesize 2048 --ramdisk ramdisk.cpio.gz --dt dt.img -o boot.img

cp $IMG/Image $BUILD_IMG/boot_flat/kernel

cd $BUILD_IMG

./mkboot boot_flat boot.img

# Copy boot.img to Output
cp boot.img $ZIP_DIR/hybridmax/boot.img

#########################################################################################
# Generate Odin Flashable Kernel

tar -H ustar -cvf $KERNEL_NAME.tar boot.img
md5sum -t $KERNEL_NAME.tar >> $KERNEL_NAME.tar
mv $KERNEL_NAME.tar output_kernel

#########################################################################################
# ZIP Generation

echo "Make ZIP..........................."
echo
cd $ZIP_DIR
zip -r $KERNEL_NAME.zip *
mv $KERNEL_NAME.zip ../output_kernel

#########################################################################################
# Cleaning Up

cd ../..
echo "Make Clean..........................."
echo
rm -rf $BUILD_IMG/boot_flat/Image
rm -rf $BUILD_IMG/boot_flat/kernel
rm -rf $BUILD_IMG/boot.img
rm -rf $BUILD_IMG/zip_files/boot.img
rm -rf $BUILD_IMG/zip_files/hybridmax/boot.img
rm -rf $BUILD_IMG/zip_files/system/lib/modules/*
echo "Done, $KERNEL_NAME.zip is ready!"
echo
echo "**************************************"
