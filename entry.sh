#!/bin/bash

set -euo pipefail

# Validate environment variables
if [ -z "${DOMAIN}" ]; then
  echo "Missing required DOMAIN environment variable:" >&2
  exit 1 
  fi

# Create the database folder if it doesn't exists
if [ ! -d /data ]; then
  mkdir /data
fi


#update configuration file
sed -i '/public_url =/ c\public_url = http://${DOMAIN}' \
    -i '/sqluri =/ c\sqluri = sqlite:////data/dbsync.db' /ffsync/syncserver.ini

#Allow users to register or not
[ -n "${NO_REGISTER:-}" ] && sed -i '/allow_new_users =/ c\allow_new_users = false' /ffsync/syncserver.ini


echo Ready
# Launch firefox sync server 
cd /ffsync/ && make serve


