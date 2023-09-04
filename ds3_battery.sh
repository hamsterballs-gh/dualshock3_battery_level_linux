
#!/bin/bash

# Dualshock3 Battery Level

# A simple bash script to print the battery levels of attached and supported controllers

# A standard user should be able to run this as normal, root is not required

# This utilises the default Linux behaviour of allowing access to controller information
# in /sys/class/power_supply

# How it works:
# Loop through every directory(controller) in the power_supply directory
# For each controller, get the capacity (read the capacity file)
# Use echo to display it nicely

controllers_seen=0

for d in /sys/class/power_supply/* ; do
	if [ -d "$d" ]; then
		controllers_seen=$((controllers_seen+1))
		bat_name=$(basename $d)
		bat_capacity=$(cat $d/capacity)
		echo "$bat_name -- $bat_capacity%"
	fi
done

if [ $controllers_seen -eq 1 ]; then
	echo "$controllers_seen controller was detected"
else
	echo "$controllers_seen controllers were detected"
fi

