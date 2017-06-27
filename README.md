# sign
A simple utility which I use to sign and align android apk's

Change line 42:
~/Android/Sdk/build-tools/25.0.2/zipalign -v 4 "$apkfile" release-"$apkfile"

To point to your zipalign installation.
