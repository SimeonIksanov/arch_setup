#!/usr/bin/env bash

# exit immediately on any error
set -e

FILEPATH="/etc/pam.d/sddm"

TEXT='\
\
#fingerprint auth block start\
auth 	[success=1 new_authtok_reqd=1 default=ignore]  	pam_unix.so try_first_pass likeauth nullok\
auth 	sufficient  	pam_fprintd.so\
#fingerprint auth block end'

GREPPATTERN='fingerprint auth block'

grep -q $GREPPATTERN $FILEPATH 2>/dev/null

if [ $? -eq 0 ]; then
	echo 'sddm file already has wanted lines'
	exit 0
fi

sudo sed -i "2i $TEXT" $FILEPATH
