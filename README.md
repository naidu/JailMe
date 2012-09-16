JailMe
======

The script to monitor multi line attacks where fail2ban fails.  The idea is to catch those multi line attacks and write them in another file in one line so that fail2ban can catch them. 

Usage:
  Copy the files in files to /etc folder.
  To run the script in background, execute launchJailme.sh

Upcoming update:
  Installing and running the script as a service.

Extra notes:
  The script is written to monitor astrisk log but is not limitted.  If you are familer with shell script, you will be able to modify and use this script to monitor other log files as well.  Alternatively, you can also contact me for any modifications / suggesation to improve the script.
  