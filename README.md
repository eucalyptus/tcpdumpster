tcpdumpster
===========

TCP Packet Monitoring with HTML Web Rendering Support via Gnuplot

  * Mainly Developed to Monitor the Traffic of Eucalyptus User Console

## Usage

On Cento 6 image,

Clone tcpdumpster on your local machine:

<code>
git clone git://github.com/eucalyptus/tcpdumpster.git
</code>

To monitor the TCP packet transmission on the port 8888:

<code>
 ./installer-tcpdumpster-webservice.py -p 8888
</code>

### Optional.

To Set the TimeZone information at the install time:

<code>
 ./installer-tcpdumpster-webservice.py -p 8888 -r west
</code>

## Monitor

URL of tcpdumpster Rendering HTML page:

<code>
http://ip_of_the_machine/tcpdumpster.php
</code>

For example, when monitoring the machine 192.168.51.6:

<code>
http://192.168.51.6/tcpdumpster.php
</code>

## TODO

<del>
1. Remove the line

"sudo ln --symbolic --force /usr/share/zoneinfo/America/Los_Angeles /etc/localtime"

in the installer and make it optional.
</del>

DONE - 11/26/12
