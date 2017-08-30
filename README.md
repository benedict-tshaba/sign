Simple utilities which I use to sign and align android apk's; backup and restore my linux machine and compile static/shared C/C++ libraries.

#### sign.sh
    Change line 42:
    ~/Android/Sdk/build-tools/25.0.2/zipalign -v 4 "$apkfile" release-"$apkfile"
    To point to your zipalign installation.

# Usage
## sign.sh
This tool can be used to sign and align android apk's built on linux.
```
chmod +x sign.sh
./sign.sh application.apk release-key.keystore
```
### Outputs: release-application.apk

## restore.sh
This tool restores your system from backup, may require root privs.
```
chmod +x restore.sh
./restore backup-2017.tgz
```
### Outputs: restores all files from backup-2017.tgz to the root '/' directory. i.e. it is a system restore utility.

## backup.sh
This tool backs up your complete system or just a few directories, may require root privs.
```
chmod +x backup.sh
./backup.sh benedict "/home /etc /opt"
```
### Outputs: a file named backup- followed by username and date where username == benedict above; changed it to your username.

## libcompile.sh
This tool can be used to compile static/dynamic libraries for linux.
```
chmod +x libcompile.sh
./libcompile.sh static mylibrary.c mylibrary.a
    OR
./libcompile.sh dynamic mylibrary.c mylibrary.so
```
## codetemple.pl
This tool can be used to generate a code template for GPLv3 licensed code. I created it because I got tired of always having to type in the GNU/GPL license header on top of my source code files.
```
chmod +x codetemple.pl
./codetemple.pl benedict C
```
### Outputs: main.c
