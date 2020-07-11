#!/bin/bash

#Host=server.domain.com
Host=localhost
BackupDir=/backup/mysql

Dump="/usr/bin/mysqldump --skip-extended-insert --force"
MySQL=/usr/bin/mysql

Today=$(date "+%a")

Databases=$(echo "SHOW DATABASES" | $MySQL -h $Host)


for db in $Databases; do
        date=`date`
        file="$BackupDir/$Host-$db-$Today.sql.gz"
        echo "Backing up '$db' from '$Host' on '$date' to: "
        echo "   $file"
        $Dump -h $Host $db | gzip > $file
done
