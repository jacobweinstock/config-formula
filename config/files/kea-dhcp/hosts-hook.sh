#!/bin/sh
# This script adds and removes records in a hosts formatted file whenever a DHCP client
# gets a lease or a lease expires.

LOGFILE=/tmp/kea-hook-runscript-debug.log

case "$1" in
  "lease4_select")
    if $(grep -q ${KEA_LEASE4_ADDRESS} /app/config/shared/hostsfile/hosts); then
      pass
    else
      cat <<EOF >> /app/config/shared/hostsfile/hosts
${KEA_LEASE4_ADDRESS}  ${KEA_LEASE4_HOSTNAME}
EOF
    fi
    echo "== $1 ==" >> $LOGFILE
    date >> $LOGFILE
    env >> $LOGFILE
    echo >> $LOGFILE
    echo >> $LOGFILE
    ;;
  "lease4_renew")
    echo "== $1 ==" >> $LOGFILE
    date >> $LOGFILE
    env >> $LOGFILE
    echo >> $LOGFILE
    echo >> $LOGFILE
    ;;
  "lease4_release"|"lease4_expire")
    sed -i "/${KEA_LEASE4_ADDRESS}/d" /app/config/shared/hostsfile/hosts
    echo "== $1 ==" >> $LOGFILE
    date >> $LOGFILE
    env >> $LOGFILE
    echo >> $LOGFILE
    echo >> $LOGFILE
    ;;
  "lease4_decline")
    echo "== $1 ==" >> $LOGFILE
    date >> $LOGFILE
    env >> $LOGFILE
    echo >> $LOGFILE
    echo >> $LOGFILE
    ;;
esac