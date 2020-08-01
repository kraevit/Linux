#!/bin/bash

BACKUP_TIME=`date +%b-%d-%y` #get the current date

SOURCE=/home/usr/path/data_folder #the folder that contains the files that we want to backup

DESTINATION=/home/usr/path/backup-$BACKUPTIME.tar.gz #create a backup file using the current date in it's name

tar -cpzf $DESTINATION $SOURCEFOLDER #create the backup

### Run this commands in terminal to setup cronjob ###
######################################################
# Let’s say that we want to run the script everyday at 12:30 a.m. we would type

# $ crontab -e
# $ 29 0 * * * /bin/bash /path/backup_script.sh

# 29 stands for the 30 minute
# 0 stands for 12 a.m.
# The first * stands for everyday, the second * stands for every month, the third * stands for every week day.
