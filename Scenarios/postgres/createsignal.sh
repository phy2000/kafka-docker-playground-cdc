#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/../../scripts/utils.sh
POSTGRES_USER=myuser
POSTGRES_PASSWORD=mypassword
POSTGRES_DB=postgres

log "**************** BEGIN ******************"
log "*************** Creating Signal TABLE *******************"
docker exec postgres bash -c "psql -U myuser -d postgres -c 'CREATE TABLE public.dbz_signal (id varchar(64), type varchar(32), data varchar(2048))'"

log "**************** DONE  ******************"
