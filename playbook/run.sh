#! /bin/sh

# Command 1
 ansible vagrant-target -m ping

# Command 2
ansible vagrant-target -m command -a uptime

# Command 3, default command
ansible vagrant-target -a uptime

# Command 4
ansible vagrant-target -a "tail /var/log/dpkg.log"

# Command 5, as root
ansible vagrant-target -b -a "tail /var/log/syslog"

# Command 6, Install package
ansible vagrant-target -b -m apt -a name=nginx
