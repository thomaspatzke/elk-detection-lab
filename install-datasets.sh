#!/bin/bash

echo "Waiting for Elasticsearch..."
until curl -s elasticsearch:9200
do
    sleep 1
done

echo "Waiting for green Elasticsearch cluster state..."
until curl -s elasticsearch:9200/_cluster/health | jq -e '.status == "green"'
do
    sleep 1
done

# Indices already exist
if [[ $(curl -s 'localhost:9200/_cat/indices/winlogbeat-*' | wc -l) >= 2 ]]
then
    exit 0
fi

mordor/scripts/es-import.py --elasticsearch elasticsearch -r mordor
evtx2es/src/evtx2es/evtx2es.py --host elasticsearch --index winlogbeat-evtx EVTX-ATTACK-SAMPLES
