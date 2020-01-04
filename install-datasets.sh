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

mordor/scripts/es-import.py --elasticsearch elasticsearch -r mordor
evtx2es/src/evtx2es/evtx2es.py --host elasticsearch --index winlogbeat-evtx EVTX-ATTACK-SAMPLES
curl -s -X POST -H "kbn-xsrf: true" --form file=@kibana-settings.ndjson "kibana:5601/api/saved_objects/_import?overwrite=true"
