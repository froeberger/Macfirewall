Jennifer, this is 'FrancisFromResponseBase' on StackExchange.  I answered three of your PF related questions, before realizing that you have not arrived at a working PF as yet.  That's no fun at all.


So let's fix this.  


I have created a fork of your repository, and in my proposed changes, you need to change your current /etc/pf.conf to the exact same as in my repository here.  I SUGGEST THAT YOU AVOID MAKING ANY ALTERATIONS TO ANY OF THESE FILES UNTIL WE HAVE SUCCEEDED AT TWO OBJECTIVES:


1.  GETTING PF TO LOAD AND ACCEPT AND ENABLE OUR FILTERING RULESET

2.  REGISTERING WITH LAUNCHD OUR AUTOMATIC, LAUNCH-AT-BOOT STARTUP-SCRIPT


These files come verbatim from a working PF installation on the most current version of Mac OS High Sierra.  I am the sole author of the firewall.  



You might wonder about the 'Zer0rez' referrence -- it is an antiquated and long ago defunct hacker crew I was once a founding member of whose specialties were to remain unrecognized and leave no traces and denying a target the use of their own systems.   It is also a pun on 'Zorro', as we were 'Zero' or better yet 'zError'.  I am Mexican American.


Allow me a few hours -- I will tonight ensure that your desired spec is matched by the config for this firewall.  I suspect that it exceeds what you intended for yours, in a way which affords you greater protection.  


=-=-=-=-=-=-=-=-=-=-=-=--=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

from a Terminal shell on your Mac:

      sudo touch /etc/pf.null_destinations
      sudo touch /etc/pf.null_origins
      
These two files MUST EXIST or the automatic at-boot launch WILL FAIL UNLESS YOU COMMENT OUT THE RELEVANT LINES AND ENTRIES IN THE net.zer0rez.firewall.conf file.  What they do: you can ensure that no communication will be sent from your machine to any ip address or domain name or fully-qualified host name in the pf.null_destinations file.  Good candidates for this file: cia.gov, nsa.gov, fbi.gov, and any commercial domains that you suspect of espionage, or spyware...  The pf.null_origins is an explicit list of ip addresses, domain names, and fully qualified host names to DROP and IGNORE, NO MATTER WHAT.



Next, after you download or use a text editor to create the files in my repository, you need to put each file in its appropriate directory.  The net.zer0rez.firewall.plist goes in /Library/LaunchDaemons/.  The net.zer0rez.firewall.sh goes in /usr/local/.  The pf.conf goes in /private/etc/ or /etc/.  And the master net.zer0rez.firewall.conf goes in /private/etc/, or /etc/.  Then do this:

     sudo chmod 440 /etc/net.zer0rez.firewall.conf
     sudo chmod 644 /Library/LaunchDaemons/net.zer0rez.firewall.plist
     sudo chmod 644 /etc/pf.conf
     sudo chmod 644 /etc/pf.null_destinations
     sudo chmod 644 /etc/pf.null_origins
     sudo chmod 755 /usr/local/net.zer0rez.firewall.sh
     
     
Next, test loading the zer0rez firewall into PF via 
     
     sudo /sbin/pfctl -E -f /private/etc/net.zer0rez.firewall.conf
          
          
If everything works up to this point, then congratulate yourself -- we are almost home free.  All that remains is to register the zer0rez firewall with launchd so that it is automatically enabled and activated in the startup process...
     

I am hoping that we don't need to reboot to single user and disable some system security service to do this, but will refresh my memory if need be, if the following fails for you:

     sudo launchctl bootstrap system/net.zer0rez.firewall
     sudo launchctl enable system/net.zer0rez.firewall
     sudo launchctl kickstart -kp system/net.zer0rez.firewall
     
     
Whew!...


Take care,


F.
  
      
