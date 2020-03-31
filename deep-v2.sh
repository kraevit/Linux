#!/bin/bash
# DEEP.SH script by Horrow ( Debian Edition )

echo -e "DEEP.SH script by Horrow \n\n"
echo -e "Kill script by pressing Cntr+C \n"

# Check to see if TOR is installed ?
echo -e "Checking if TOR is installed ... ? \n"
TOR="/etc/init.d/tor"

if [  -f $TOR ] then;
  echo -e "TOR is installed on your system! \n"
  echo -e "Starting TOR :) \n"
  sudo systemctl start tor
else
  echo -e "TOR is not installed. You can install it by apt update && apt install tor command! \n"
  exit
fi

# Check to see if PROXYCHAINS is installed ?
echo -e "Checking if PROXYCHAINS is installed ... ? \n"
PROXYCHAINS="/etc/proxychains.conf"

if [ -f $PROXYCHAINS ] then;
  echo -e "PROXYCHAINS is installed on your system! \n"
else
  echo -e ="PROXYCHAINS is not installed. You can install it by apt update && apt install proxychains \n"
  exit
fi

# Set TIMEOUT to restart TOR to change IP in Seconds
echo -e "Please, enter how many seconds ( min. 30s ) you want to grab a new IP: \c"
read TIMER

if [ "$TIMER" -lt "30" ] then;
  echo -e "Warning! Less than 30 seconds is not suggested due to timeout errors. \n"
  echo -e "Setting up timer ... \n"
fi

function control_c {
  echo -en "\n Googbye: Happy hacking! :) \n"
  sudo systemctl stop tor
  echo -en "Tor has been killed. You are no longer hidden! \n"
  echo -e "ERROR: Launching the missiles now! \n"
  exit $?
}

# Capture SIGINT  ( CNTR+C ) and kill the script
trap control_c SIGINT

# Switch IP
for (( ; ; )) # Ifinity Loop
do
  sleep $TIMER
  sudo systemctl restart tor
  echo -e "$TIMER seconds until next IP change ... \n"
done

# The END