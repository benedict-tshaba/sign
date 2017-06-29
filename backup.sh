#!/bin/bash
####################################
#
# Backup Script - Tshaba P.B
# Usage: ./backup.sh username "/home /etc /root /opt"
#
####################################

# What to backup. 
backup_files=$2

# The first argument which is supposed to be the username
USER=$1

usage()
{
	printf "Usage: $0 username '/home /etc /opt' \n"
	exit 0
}

if [ -z "$back_up_files" ]
then
	usage
fi

if [ -z "$USER" ]
then
	usage
fi

# Where to backup to.
dest="/media/$USER/BackupDrive"

# Create archive filename.
day=$(date +%A-%F-%X)
archive_file="backup-$USER@$HOSTNAME-$day.tgz"
snapshot="snapshot.snar"

# Print start status message.
echo "Tshaba P.B's System Backup Utility"
date
echo
echo "Backing up $backup_files to $dest/$archive_file"
echo

# Backup the files using tar.
tar czf $dest/$archive_file -g $dest/$snapshot $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest

# m h dom mon dow   command
# 0 0 * * * bash /usr/local/bin/backup.sh
