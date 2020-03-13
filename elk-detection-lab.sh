#!/bin/bash

case "$1" in
    init)
        echo "Unpacking malware-traffic-analysis.net data..."
        bunzip2 -k malware-traffic-analysis.net/eve.json.bz2
        docker-compose build
        docker-compose up
        rm malware-traffic-analysis.net/eve.json
        ;;
    init-windowsonly)
        docker-compose build
        docker-compose up
        rm malware-traffic-analysis.net/eve.json
        ;;
    run)
        docker-compose up elasticsearch kibana
        ;;
    rm)
        docker-compose rm -f
        ;;
    *)
        cat <<HELP;;
Usage:
$0 init: run environment and import data.
$0 run: run already initialized environment.
$0 rm: discard the environment (frees disk space, has to be recreated with init command)
HELP
esac
