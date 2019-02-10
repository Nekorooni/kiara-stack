vagrant up
vagrant ssh -- -t 'cd /usr/src/kiara-stack/; docker-compose up -d; sleep 5s; docker-compose restart kiara; /bin/bash'