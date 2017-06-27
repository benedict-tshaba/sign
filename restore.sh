#!/bin/bash
####################################################
#
# System Restoration Script - Tshaba P.B
# Usage: ./restore backup-file.tgz
#
####################################################

files2restore=$1

usage()
{
	printf "Usage: $0 backup-files.tgz\n"
	exit 0
}

if [ -z $files2restore ]
then
	usage
fi

echo "Restoring System from backup: $files2restore"
echo

tar xvpfz $files2restore -C /

echo
echo "System Restore Complete!"
