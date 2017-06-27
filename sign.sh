#!/bin/bash

apkfile="$1" ## e.g my-app.apk
signkey="$2" ## e.g my-release-key.keystore

usage()
{
	printf "Usage: $0 my-app.apk my-release-key.keystore\n"
	exit 0
}

if [ -z "$apkfile" ]
then
	usage
fi

if [ -z "$signkey" ]
then
	usage
fi

if [ ! -e "$apkfile" ]
then
	echo "Invalid Apk File!"
	exit 1
fi

if [ ! -e "$signkey" ]
then
	echo "No keystore was found. Generating one now..."
	keytool -genkey -v -keystore "$signkey" -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
fi

echo "Signing your app..."

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore "$signkey" "$apkfile" alias_name

echo "Verifying your signatures..."
jarsigner -verify -verbose -certs "$apkfile"

echo "Aligning your app to a 4k boundary..."
~/Android/Sdk/build-tools/25.0.2/zipalign -v 4 "$apkfile" release-"$apkfile"

echo "Cleaning up..."
rm "$apkfile"

echo "Done!"
