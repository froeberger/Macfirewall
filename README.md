# Macfirewall

I am trying to block all the traffic on my computer that does not belong to my internet usage.
I only use the internet for browsing the internet and sending emails.

I want my firewall to be sthealth and drop all packets that do no bellong to my internet usage.

If found this configuration on the internet for openbsd and modified it to my needs and I want to keep the original Mac Rules but add my rules to it.

If you have any suggestions on how I can make my firewall more secure (by limiting the connection possibilities that can be made) feel free to do.

This is my first upload to github so sorry if I did it wrong.

Jennifer Ruurs

```
scrub-anchor "com.apple/*"
nat-anchor "com.apple/*"
rdr-anchor "com.apple/*"
dummynet-anchor "com.apple/*"
anchor "com.apple/*"
load anchor "com.apple" from "/etc/pf.anchors/com.apple"

ext_if = "en0"

# These macros define the ports we let in and out.
webports = "{http, https}"
needout = "{ssh, domain, ntp, www, https, git, ftp}"
turn = "{3478}"
turns = "{5349}"


# Default Deny!
block return in log all
block out all

antispoof quick for $ext_if

# Block bruteforce
table <bruteforce> persist
block quick from <bruteforce>

martians = "{ 127.0.0.0/8, 192.168.0.0/16, 172.16.0.0/12, \
          10.0.0.0/8, 169.254.0.0/16, 192.0.2.0/24, \
          0.0.0.0/8, 240.0.0.0/4 }"

block drop in quick on $ext_if from $martians to any
block drop out quick on $ext_if from any to $martians

## Blocking spoofed packets
antispoof quick for $ext_if


# Allow in web traffic
pass proto tcp from any to $ext_if port $webports
```
