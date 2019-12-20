#!/bin/sh

## go_deep.sh ##
################

echo -e "GoDeep by horrow https://keytothe.net/\n\n"
echo -e "To stop the script press Cntrl+C\n"

## Check if tor is installed? ##
################################
echo -e "Checking if tor is installed ... ?\n"
TOR="/etc/init.d/tor"

if [ -f $TOR ];
then
  echo -e "Tor is installed on your system!\n"
  echo -e "starting Tor :)\n"
  sudo service tor start
else
  echo -e "Tor is not installed! You can install it by the following command: apt update && apt install tor\n"
exit
fi

## Check if proxychains is installed? ##
########################################
echo -e "Checking if proxychains is installed ... ?\n"
PROXYCHAINS="/etc/proxychains.conf"

if [ -f $PROXYCHAINS ];
then
  echo -e "proxychains is installed on your system!\n"
else
  echo -e "proxychains is not installed! You can install it by the following command: apt update && apt install proxychains\n"
exit
fi

## Set timeout to restart tor to change IP in Seconds. ##
#########################################################
echo -e "Please enter how many seconds(at least 30sec) you want to grab a new IP: \c"
read TIMER

if [ "$TIMER" -lt "30" ];
then
  echo -e "WARN: Less than 30 seconds is not suggested due to timeout errors!\n"
  echo -e "Setting up timer, please standby...\n"
fi

function control_c {
  echo -en "\nGoodbye - Happy hacking!\n"
  service tor stop
  echo -en "Tor has been stopped. You are no longer hidden!\n"
  exit $?
}

## Capture SIGINT (Ctrl-C) and exit the script clean. ##
########################################################
trap control_c SIGINT

## Switch IP Addr ##
####################
for (( ; ; ))
do
  sleep $TIMER
  service tor restart
  echo -e "$TIMER Seconds until next IP change \n"
done
