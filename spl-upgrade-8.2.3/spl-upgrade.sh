#!/bin/bash

echo "Upgrading Splunk to 8.2.3 "


# Stop splunk service
/opt/splunkforwarder/bin/splunk stop


# Upgrade splunk based on Linux Distro
if [ -r '/etc/redhat-release' ]; then
                rpm -Uvh splunkforwarder-8.2.3-cd0848707637-linux-2.6-x86_64.rpm 
fi

if [ -r '/etc/lsb-release' ]; then
           dpkg -i  splunkforwarder-8.2.3-cd0848707637-linux-2.6-amd64.deb
fi

# Start splunk service
/opt/splunkforwarder/bin/splunk  start --accept-license --answer-yes


#
echo "Updade finished"