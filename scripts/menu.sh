#!/bin/bash

# Variables
SETUP_SCRIPT="./scripts/setup.sh"
BACKUP_SCRIPT="./scripts/backup.sh"
MONITOR_SCRIPT="./scripts/monitor.sh"

# Functions
run_setup() {
    bash $SETUP_SCRIPT
}

run_backup() {
    bash $BACKUP_SCRIPT
}

run_monitor() {
    bash $MONITOR_SCRIPT
}

# Menu Loop
while true
do
    echo "-----------------------------"
    echo " DevOps Automation Toolkit "
    echo "-----------------------------"
    echo "1. Setup Environment"
    echo "2. Backup Files"
    echo "3. Monitor System"
    echo "4. Exit"
    echo "-----------------------------"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            run_setup
            ;;
        2)
            run_backup
            ;;
        3)
            run_monitor
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Try again."
            ;;
    esac
done
