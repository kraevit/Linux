#!/bin/bash

echo -e "deep.sh script by horrow (Debian) \n\n"
echo -e "Kill script by pressing Cntr+C \n"

echo -e "Checking if TOR is installed? \n"

TOR="/etc/init.d/tor"
if [[ -f $TOR ]]; then
	echo -e "TOR is intalled on your system! \n"
	echo -e "Starting TOR :) \n"
	systemctl start tor
else
	echo -e "TOR is not installed. You can install it by apt update && apt install tor \n"
	exit
fi

echo -e "Checking if PROXYCHAINS is installed? \n"

PROXYCHAINS="/etc/proxychains.conf"
if [[ -f $PROXYCHAINS ]]; then
	echo -e "PROXYCHAINS is intalled on your system! \n"
else
	echo -e "PROXYCHAINS is not installed. You can install it by apt update && apt install proxychains \n"
	exit
fi

# SETup a TIMEOUT to restart TOR to change IP in Seconds
echo -e "Please, enter how many seconds(min 30s) you want to grab a new IP: \c"

read TIMER
if [[ "$TIMER" -lt "30" ]]; then
	echo -e "Warning! Less than 30 seconds is not suggested due to timeout errors. \n"
	echo -e "Setting up timer ... \n"
fi


control_c() {
	echo -en "\n Goodbye: Happy hacking! \n"
	systemctl stop tor
	echo -en "TOR has been killed. You are no longer hidden! \n"
	echo -e "Error: Launching the missles now!"
	exit $?
}

# Capture SIGINT(CNTR+C) and kill the script
trap control_c SIGINT

# Grab new IP address
for (( ; ; )); do # INFINITY LOOP
	sleep $TIMER
	systemctl restart tor
	echo -e "$TIMER seconds untils next IP change ... \n"
done

# END
