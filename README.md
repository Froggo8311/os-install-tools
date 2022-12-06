# CarbonixOS
This repo contains various tools for installing and upgrading the operating system. 

 - `config-install.sh` contains an experimental script to install the OS & packages on a brand new Arch install.
 - `carbonix-upgrade.sh` has a script used to perform full system upgrades. May be improved in the future.
 - `upgrade/` contains files such as `to-install.txt` and `to-remove.txt` which contain names of packages to install
   or uninstall, respectively. These files are used by `carbonix-upgrade.sh`. This will eventually be replaced by 
   individual files representing each OS version, including the packages installed or removed by that update.
   Although this exists, it is solely to keep the Desktop Environment parts up-to-date with the most recent software
   in case a change occurs in what software is used (i.e. different terminal program, different file manager). The
   Operating System will maintain its status as receiving rolling software updates. We will in the future figure out
   a way to keep specific package updates from breaking the system. One example of such occurance would be the recent
   upgrade to OpenSSL, which broke various crucial Arch Linux packages, such as `pacman`, `wget`, or `curl`, requiring
   another Arch install in order to fix the problem by installing the `openssl-1.1` package.
