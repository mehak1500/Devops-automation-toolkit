#!/bin/bash

# Variables
PROJECT="DevOps Toolkit"
DIRS="logs backup data"
LOG_FILE="logs/setup.log"
FILE_COUNT=3

echo "Starting $PROJECT setup..."

# Create directories using loop
for dir in $DIRS
do
    if [ ! -d "$dir" ]; then
        mkdir $dir
        echo "$dir directory created." >> $LOG_FILE
    else
        echo "$dir already exists." >> $LOG_FILE
    fi
done

# Create sample files using loop
for (( i=1; i<=FILE_COUNT; i++ ))
do
    FILE_NAME="data/sample$i.txt"
    echo "This is sample file $i" > $FILE_NAME
done

# Check if log file exists
if [ -f "$LOG_FILE" ]; then
    echo "Log file created successfully."
else
    echo "Log file not found!"
fi

echo "Setup Completed Successfully!"
