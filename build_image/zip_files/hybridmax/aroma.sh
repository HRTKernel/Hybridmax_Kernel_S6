#!/sbin/sh

# Aroma-Installer Kernel Tune Script
#
# Copyright (c) g.lewarne@xda
#           (c) Hybridmax (hybridmax95@gmail.com)
#           (c) thehacker911 (maik.diebenkorn@gmail.com)
#
# This Script based on g.lewarnes Script.
# It was modified for my need.

#vars
PROP=/system/kernel.prop
BP=/system/build.prop

if [ "$1" = "WAIT" ]; then	
	sleep 0.7
elif [ "$1" = "FLASH" ]; then	
	dd if=/tmp/boot.img of=/dev/block/platform/15570000.ufs/by-name/BOOT
elif [ "$1" = "FIX_PERMS" ]; then	
	chmod 644 $BP
	chmod 644 $PROP
	sleep 0.7

# SCHEDULER
elif [ "$1" = "CFQ" ]; then
	echo "kernel.scheduler=cfq" >> $PROP

elif [ "$1" = "BFQ" ]; then
	echo "kernel.scheduler=bfq" >> $PROP

elif [ "$1" = "DEADLINE" ]; then
	echo "kernel.scheduler=deadline" >> $PROP

elif [ "$1" = "FIOPS" ]; then
	echo "kernel.scheduler=fiops" >> $PROP

elif [ "$1" = "NOOP" ]; then
	echo "kernel.scheduler=noop" >> $PROP

elif [ "$1" = "ROW" ]; then
	echo "kernel.scheduler=row" >> $PROP

elif [ "$1" = "SIOPLUS" ]; then
	echo "kernel.scheduler=sioplus" >> $PROP

elif [ "$1" = "TRIPNDROID" ]; then
	echo "kernel.scheduler=tripndroid" >> $PROP
sleep 0.7

# GOVERNORS
elif [ "$1" = "CONSERVATIVE" ]; then
	echo "kernel.governor=conservative" >> $PROP

elif [ "$1" = "INTERACTIVE" ]; then
	echo "kernel.governor=interactive" >> $PROP

elif [ "$1" = "ONDEMAND" ]; then
	echo "kernel.governor=ondemand" >> $PROP

elif [ "$1" = "PERFORMANCE" ]; then
	echo "kernel.governor=performance" >> $PROP

elif [ "$1" = "ALUCARD" ]; then
	echo "kernel.governor=alucard" >> $PROP

elif [ "$1" = "BIOSHOCK" ]; then
	echo "kernel.governor=bioshock" >> $PROP

elif [ "$1" = "DANCEDANCE" ]; then
	echo "kernel.governor=dancedance" >> $PROP

elif [ "$1" = "LIONHEART" ]; then
	echo "kernel.governor=lionheart" >> $PROP

elif [ "$1" = "SMARTASS2" ]; then
	echo "kernel.governor=smartass2" >> $PROP

elif [ "$1" = "WHEATLEY" ]; then
	echo "kernel.governor=wheatley" >> $PROP
sleep 0.7

# CPU CLOCK A53

elif [ "$1" = "A53-200" ]; then
	echo "kernel.cpu.a53.min=200000" >> $PROP

elif [ "$1" = "A53-300" ]; then
	echo "kernel.cpu.a53.min=300000" >> $PROP

elif [ "$1" = "A53-400" ]; then
	echo "kernel.cpu.a53.min=400000" >> $PROP

elif [ "$1" = "A53-1200" ]; then
	echo "kernel.cpu.a53.max=1200000" >> $PROP

elif [ "$1" = "A53-1296" ]; then
	echo "kernel.cpu.a53.max=1296000" >> $PROP

elif [ "$1" = "A53-1400" ]; then
	echo "kernel.cpu.a53.max=1400000" >> $PROP

elif [ "$1" = "A53-1500" ]; then
	echo "kernel.cpu.a53.max=1500000" >> $PROP

elif [ "$1" = "A53-1600" ]; then
	echo "kernel.cpu.a53.max=1600000" >> $PROP
sleep 0.7

# CPU CLOCK A57

elif [ "$1" = "A57-200" ]; then
	echo "kernel.cpu.a57.min=200000" >> $PROP

elif [ "$1" = "A57-300" ]; then
	echo "kernel.cpu.a57.min=300000" >> $PROP

elif [ "$1" = "A57-400" ]; then
	echo "kernel.cpu.a57.min=400000" >> $PROP

elif [ "$1" = "A57-500" ]; then
	echo "kernel.cpu.a57.min=500000" >> $PROP

elif [ "$1" = "A57-600" ]; then
	echo "kernel.cpu.a57.min=600000" >> $PROP

elif [ "$1" = "A57-700" ]; then
	echo "kernel.cpu.a57.min=700000" >> $PROP

elif [ "$1" = "A57-800" ]; then
	echo "kernel.cpu.a57.min=800000" >> $PROP

elif [ "$1" = "A57-1704" ]; then
	echo "kernel.cpu.a57.max=1704000" >> $PROP

elif [ "$1" = "A57-1800" ]; then
	echo "kernel.cpu.a57.max=1800000" >> $PROP

elif [ "$1" = "A57-1896" ]; then
	echo "kernel.cpu.a57.max=1896000" >> $PROP

elif [ "$1" = "A57-2000" ]; then
	echo "kernel.cpu.a57.max=2000000" >> $PROP

elif [ "$1" = "A57-2100" ]; then
	echo "kernel.cpu.a57.max=2100000" >> $PROP

elif [ "$1" = "A57-2200" ]; then
	echo "kernel.cpu.a57.max=2200000" >> $PROP

elif [ "$1" = "A57-2304" ]; then
	echo "kernel.cpu.a57.max=2304000" >> $PROP
sleep 0.7

# TCP CONGESTION CONTROLLER
elif [ "$1" = "TCP-BIC" ]; then
	echo "kernel.tcp.cong=bic" >> $PROP

elif [ "$1" = "TCP-CUBIC" ]; then
	echo "kernel.tcp.cong=cubic" >> $PROP

elif [ "$1" = "TCP-WESTWOOD" ]; then
	echo "kernel.tcp.cong=westwood" >> $PROP

elif [ "$1" = "TCP-HSTCP" ]; then
	echo "kernel.tcp.cong=hstcp" >> $PROP

elif [ "$1" = "TCP-HYBLA" ]; then
	echo "kernel.tcp.cong=hybla" >> $PROP

elif [ "$1" = "TCP-HTCP" ]; then
	echo "kernel.tcp.cong=htcp" >> $PROP
sleep 0.7

# INTERACTIVE TUNING
elif [ "$1" = "PERFORMANCE_INTERACTIVE" ]; then
	echo "kernel.interactive=performance" >> /system/kernel.prop

elif [ "$1" = "BATTERY_INTERACTIVE" ]; then
	echo "kernel.interactive=battery" >> /system/kernel.prop

elif [ "$1" = "STOCK_INTERACTIVE" ]; then
	echo "kernel.interactive=stock" >> /system/kernel.prop
sleep 0.7

# ARCH_POWER
elif [ "$1" = "NO_ARCH_POWER" ]; then
	echo "kernel.archpower=false" >> $PROP

elif [ "$1" = "ARCH_POWER" ]; then
	echo "kernel.archpower=true" >> $PROP
sleep 0.7

# GENTLE_FAIR_SLEEPERS
elif [ "$1" = "NO_GENTLE_FAIR_SLEEPERS" ]; then
	echo "kernel.gentlefairsleepers=false" >> $PROP

elif [ "$1" = "GENTLE_FAIR_SLEEPERS" ]; then
	echo "kernel.gentlefairsleepers=true" >> $PROP
sleep 0.7

# TURBO MODE
elif [ "$1" = "TURBO" ]; then
	echo "kernel.turbo=true" >> $PROP

elif [ "$1" = "NO_TURBO" ]; then
	echo "kernel.turbo=false" >> $PROP
sleep 0.7

# AUTOMATIC INITD CONTROL
elif [ "$1" = "AUTO_INITD" ]; then
	echo "kernel.initd=true" >> $PROP

elif [ "$1" = "NO_INITD" ]; then
	echo "kernel.initd=false" >> $PROP
sleep 0.7

# TUNED VM
elif [ "$1" = "TUNED_VM" ]; then
	echo "kernel.vm=tuned" >> $PROP
sleep 0.7

# GAPPS WAKELOCK FIX
elif [ "$1" = "FIX_GAPPS" ]; then
	echo "kernel.gapps=true" >> $PROP

elif [ "$1" = "STOCK_GAPPS" ]; then
	echo "kernel.gapps=false" >> $PROP
sleep 0.7

# REMOVE KNOX
elif [ "$1" = "KNOX" ]; then
	echo "kernel.knox=true" >> $PROP

fi
