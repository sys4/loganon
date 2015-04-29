#!/bin/bash

# copyright sys4 AG 2015

# This file is part of loganon.
# 
# loganon is free software: you can redistribute it and/or modify it under the
# terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
# 
# loganon is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public License
# along with loganon. If not, see <http://www.gnu.org/licenses/>.


export PATH="$PATH:/usr/local/sbin"

day=$(date +%Y%m%d -d "5 day ago")

# mail.log:
bunzip2 /var/log/mail/mail.log-$day.bz2
loganon \
	-i /var/log/mail/mail.log-$day \
	-o /var/log/mail/mail.log-$day-conv \
	-r /usr/local/etc/mail.rules
mv /var/log/mail/mail.log-$day-conv /var/log/mail/mail.log-$day
bzip2 /var/log/mail/mail.log-$day

# dovecot.log:
bunzip2 /var/log/mail/dovecot.log-$day.bz2
loganon \
	-i /var/log/mail/dovecot.log-$day \
	-o /var/log/mail/dovecot.log-$day-conv \
	-r /usr/local/etc/mail.rules
mv /var/log/mail/dovecot.log-$day-conv /var/log/mail/dovecot.log-$day
bzip2 /var/log/mail/dovecot.log-$day

exit 0

