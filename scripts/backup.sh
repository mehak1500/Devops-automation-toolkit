#!/bin/bash

# Variables
PROJECT_DIR=$(pwd)
BACKUP_DIR="backup"
DATE=$(date +%Y_%m_%d)
BACKUP_FILE="backup_$DATE.tar.gz"

echo "Starting backup..."

# Create backup directory if not exists
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "Backup directory created."
fi

# Create compressed backup
tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$PROJECT_DIR" --exclude="$BACKUP_DIR"

echo "Backup created: $BACKUP_FILE"

# Delete backups older than 7 days
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +7 -exec rm {} \;

echo "Old backups deleted (if any)."
echo "Backup process completed successfully!"
