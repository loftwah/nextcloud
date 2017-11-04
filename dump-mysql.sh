#!/bin/bash

mysqldump -u root -p$MYSQL_ROOT_PASSWORD --all-databases  | bzip2 -c >  /srv/backup-$(date +%Y-%m-%d-%H.%M.%S).sql.bz2
