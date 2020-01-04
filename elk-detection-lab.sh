#!/bin/bash

case "$1" in
    init)
        docker-compose build
        docker-compose up
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
