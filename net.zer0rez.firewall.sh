#!/bin/bash

/sbin/pfctl -E -f /private/etc/net.zer0rez.firewall.conf >> /var/log/net.zer0rez.firewall.log 2>&1 || echo "(!) FAILED to start net.zer0rez.firewall!" >> /var/log/net.zer0rez.firewall.log

exit 0
