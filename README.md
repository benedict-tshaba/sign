Simple utilities which I use to sign and align android apk's; backup and restore my linux machine.

#### sign.sh
    Change line 42:
    ~/Android/Sdk/build-tools/25.0.2/zipalign -v 4 "$apkfile" release-"$apkfile"
    To point to your zipalign installation.

# Usage
## sign.sh

chmod +x sign.sh
./sign.sh application.apk release-key.keystore
### Outputs: release-application.apk

## restore.sh

chmod +x restore.sh
./restore backup-2017.tgz
### Outputs: restores all files from backup-2017.tgz to the root '/' directory. i.e. it is a system restore utility.

## backup.sh

chmod +x backup.sh
./backup.sh benedict "/home /etc /opt"
### Outputs: a file named backup- followed by username and date where username == benedict above; changed it to your username.
