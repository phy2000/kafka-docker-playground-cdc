#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/../../scripts/utils.sh
POSTGRES_USER=myuser
POSTGRES_PASSWORD=mypassword
POSTGRES_DB=postgres

log "**************** BEGIN ******************"
log "*************** Send Signal *******************"

docker exec postgres bash -c \
  'psql -U myuser -d postgres -c \
  '\"'INSERT INTO public.dbz_signal VALUES  (\
  '\''signal-1'\'', '\''execute-snapshot'\'', '\''{\"data-collections\": [\"public.customers\"] }'\'')"'

log "**************** DONE ******************"
