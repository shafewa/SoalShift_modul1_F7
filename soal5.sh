#!/bin/bash

awk /'cron/ || /CRON/,!/sudo/' /var/log/syslog |awk 'NF <13' > /home/shafewa/modul1/sysget.log
