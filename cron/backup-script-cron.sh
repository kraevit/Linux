#!/bin/bash

# Get the Current Date
BACKUP_TIME="date +%d-%m-%y"

# The Folder that Contains the Files that We Want to Backup
SOURCE="/home/usr/path/data_folder "

# Create a Backup File Using the Current Date in It's Name
DESTINATION="/home/usr/path/backup-${BACKUP_TIME}.tar.gz"

# Create the Backup
tar -cpzf $DESTINATION $SOURCEFOLDER 

######################################
# How to Run the Script as a CRONJOB ?
######################################

# Let’s Say that We Want to Run the Script Everyday at 12:30A.M. We Would Type
#
# $ crontab -e
# $ 29 0 * * * /bin/bash /path/backup_script.sh

# More Info
#
# 29 Stands for the 30 Minute
# 0 Stands for 12A.M.
# The First * Stands for Everyday
# The Second * Stands for Every Month
# The Third * Stands for Every Week Day
#
# END
