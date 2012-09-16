#!/bin/bash 

# ****************************************************
#
# Author: BTR Naidu <me@btrnaidu.com>
#
# Purpose: The script is written to help fail2ban 
# find multiline attacks.  The script traps such
# attacks and puts them under one line in a separate
# log file /var/log/jailmail/messages which is 
# inturn processed and caught by fail2ban jail
# configuration.
#
# Extension: the scrip can be extended to catch 
# other multiline attacks and caught by fail2ban.
#
# ***************************************************

(tail -f /var/log/asterisk/messages | awk '

BEGIN { 
  ORS=""; 
  newline=0; 
  regEx="(app_mor_authentication.c: Accountcode|app_mor_debug.c: Peer IP: )";
}
 
#index($0, regEx) { 
/(app_mor_authentication.c: Accountcode|app_mor_debug.c: Peer IP: )/ { 
  print $0; fflush();
  if( newline ) { 
    print "\n"; fflush();
    newline = 0; 
  } else { 
    newline = 1; 
  } 
} 
'  
) > /var/log/jailme/messages
