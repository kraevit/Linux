#!/bin/bash

# Hello World :D
echo -e "$0 Script Proudly Developed by horrow \n\n"
echo -e "Kill the Script by Pressing cntr+c \n"

# Checking TOR
echo -e "Checking if TOR is Installed? \n"
TOR="/etc/init.d/tor"
if [[ -f $TOR ]]; then
  echo -e "TOR is Intalled on Your System. \n"
  echo -e "Starting TOR ... \n"
  systemctl start tor
else
  echo -e "TOR is NOT Installed. You Can Install it by : apt install tor tor \n"
  exit
fi

# Checking PROXYCHAINS
echo -e "Checking if PROXYCHAINS is Installed? \n"
PROXYCHAINS="/etc/proxychains.conf"
if [[ -f $PROXYCHAINS ]]; then
  echo -e "PROXYCHAINS is Intalled on Your System! \n"
else
  echo -e "PROXYCHAINS is Not Installed. You Can Install it by : apt install proxychains \n"
  exit
fi

# Set IP Switch Interval
echo -e "Please, Enter How Many Seconds(Minimum 30s) You Want to Grab a New IP address: \c"
read TIMER
if [[ "$TIMER" -lt "30" ]]; then
  echo -e "Warning! Less than 30 Seconds is NOT Suggested DUE to TIMEOUT ERRORS. \n"
  echo -e "Setting UP Timer ... \n"
fi

# Shortcut to Kill the Script
control_c() {
  echo -en "\n Goodbye: Happy Hacking :) \n"
  systemctl stop tor
  echo -en "TOR has been Killed. You are no Longer Hidden! \n"
  echo -e "ERROR: Launching the missles now!"
  exit $? # exit status of last task
}
trap control_c SIGINT

# Grab New IP
#for (( ; ; )); do # INFINITY LOOP
for true; do
  sleep $TIMER
  systemctl restart tor
  echo -e "$TIMER Seconds Until Next IP Change. \n"
done
