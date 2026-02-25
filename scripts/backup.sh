#!/bin/bash

# Variable
SOURCE_DIR="/home/$USER/testdata"
BACKUP_DIR="/home/$USER/backup"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist!"
    exit 1
fi

# Create backup directory if not exists
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "Backup directory created."
fi

# Loop through files and copy
for file in $SOURCE_DIR/*; do
    cp "$file" "$BACKUP_DIR/"
done

# Create compressed backup
tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" -C "$BACKUP_DIR" .

echo "Backup completed successfully!"
