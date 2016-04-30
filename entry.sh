#!/bin/sh

set -euo pipefail

# Validate environment variables
MISSING=""

[ -z "${DOMAIN}" ] && MISSING="${MISSING} DOMAIN"
[ -z "${PORT}" ] && MISSING="${MISSING} PORT"

if [ "${MISSING}" != "" ]; then
  echo "Missing required environment variables:" >&2
  echo " ${MISSING}" >&2
  exit 1 
  fi

# Create the database folder if it doesn't exists
if [ ! -d /data ]; then
  mkdir /data
fi

#update configuration file
sed -i '/public_url =/ c\public_url = http://'${DOMAIN}'' /syncserver/syncserver.ini
sed -i '/sqluri =/ c\sqluri = sqlite:////data/dbsync.db' /syncserver/syncserver.ini

#Allow users to register or not
[ -n "${NO_REGISTER:-}" ] && sed -i '/allow_new_users =/ c\allow_new_users = false' /syncserver/syncserver.ini


echo "Launching Firefox Sync Server on '${DOMAIN}'"
# Launch firefox sync server 
cd /syncserver && make serve


