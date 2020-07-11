#!/bin/sh

FILE=backup.sql.`date +"%Y%m%d"`
DBSERVER=127.0.0.1
# DBSERVER=localhost
DATABASE=database-name
USER=user-name
PASS=your-password

unalias rm     2> /dev/null
rm ${FILE}     2> /dev/null
rm ${FILE}.gz  2> /dev/null

mysqldump --opt --user=${USER} --password=${PASS} ${DATABASE} > ${FILE}
gzip $FILE
echo "${FILE}.gz was created:"
ls -l ${FILE}.gz
