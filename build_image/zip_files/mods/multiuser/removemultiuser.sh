#!/sbin/sh
#update build.prop
sed -i '/#Multiuser/ d' /system/build.prop
sed -i '/fw.max_users=3/ d' /system/build.prop
sed -i '/fw.show_multiuserui=1/ d' /system/build.prop

