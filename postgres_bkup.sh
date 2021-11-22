#!/bin/ash

date=`date +"%Y%m%d"`
pg_dump -h $DATABASE_HOST -p 5432 -U $DATABASE_USER $DATABASE_NAME > $DATABASE_NAME${date}.bak
gzip $DATABASE_NAME${date}.bak
echo test:x:$(id -u):$(id -u):test:/code:/bin/ash >> /etc/passwd
sshpass -p $STORAGE_PASSWORD scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  $DATABASE_NAME${date}.bak.gz $STORAGE_USER@$STORAGE_HOST:$STORAGE_PATH
