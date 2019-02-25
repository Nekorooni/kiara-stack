#!/bin/sh
# Rename dev docker-compose file if it's not
[ ! -f "docker-compose-dev.yml" ] && mv docker-compose-dev.yml docker-compose.override.yml
# Start up vagrant and ssh into it, cd to the right folder, and restart the kiara service
vagrant up
vagrant ssh -- -t 'cd /usr/src/kiara-stack/; docker-compose up -d; sleep 5s; docker-compose restart kiara; /bin/bash'