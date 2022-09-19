#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/../../scripts/utils.sh

log "**************** BEGIN ******************"
log "*************** Check CDC topic(s)  *******************"

DEFAULT_CONSUMER_GROUP=CDC_CONSUMER_GROUP

if [ -z $1 ]; then
  CDC_CONSUMER_GROUP=$DEFAULT_CONSUMER_GROUP
else
  CDC_CONSUMER_GROUP=$1
fi

log "Using consumer group $CONSUMER_GROUP"

log "Verifying topic asgard.public.customers-raw"
docker exec connect kafka-avro-console-consumer -bootstrap-server broker:9092 \
  --property schema.registry.url=http://schema-registry:8081 \
  --group $CDC_CONSUMER_GROUP \
  --topic asgard.public.customers-raw \
  --property print.key=true

