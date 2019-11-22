#!/bin/bash

#first move the contents of the old backup out and clear the directory
echo "Moving old influxdb backups if they exist"
[ -d ~/my-pistack/backups/influxdb/db_old ] || sudo mkdir ~/my-pistack/backups/influxdb/db_old
sudo rm ~/my-pistack/backups/influxdb/db_old/* >/dev/null 2>&1
sudo mv ~/my-pistack/backups/influxdb/db/* ~/my-pistack/backups/influxdb/db_old/ >/dev/null 2>&1
#sudo rm ~/my-pistack/backups/influxdb/db/*

#execute the backup command
echo "backing up influxdb database"
docker exec -it influxdb influxd backup -portable /var/lib/influxdb/backup >/dev/null 2>&1
echo "influxdb backup complete"
