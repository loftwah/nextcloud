#!/bin/bash

mysqldump -u root -p"$(cat /run/secrets/db_pwd)" --all-databases | gzip  > /srv/backup-"$(date +%Y-%m-%d-%H.%M.%S)".sql.gz
