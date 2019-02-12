@echo off
rem Rename dev docker-compose file if it's not
if exist docker-compose-dev.yml ren docker-compose-dev.yml docker-compose.override.yml
rem Start up vagrant and ssh into it, cd to the right folder, and restart the kiara service
vagrant up
vagrant ssh -- -t 'cd /usr/src/kiara-stack/; docker-compose up -d; sleep 5s; docker-compose restart kiara; /bin/bash'