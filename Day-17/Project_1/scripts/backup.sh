#!/bin/bash

# Database credentials
USER="siddh"
PASSWORD="siddh1234"
HOST="localhost"
DB_NAME="my_database"

# Other options
BACKUP_PATH='/ubuntu/backup/directory'
DATE=$(date +%F)

# Set default file permissions
umask 177

# Dump database into SQL file
mysqldump --user=$USER --password=$PASSWORD --host=$HOST $DB_NAME > $BACKUP_PATH/$DB_NAME-$DATE.sql

# Remove backups older than 7 days
find $BACKUP_PATH/* -mtime +7 -exec rm {} \;
