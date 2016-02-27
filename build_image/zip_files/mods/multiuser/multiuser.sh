#!/sbin/sh
#update build.prop

echo "#Multiuser" >> /system/build.prop
echo "fw.max_users=3" >> /system/build.prop
echo "fw.show_multiuserui=1" >> /system/build.prop

