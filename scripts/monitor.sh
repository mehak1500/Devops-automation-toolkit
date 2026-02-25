#!/bin/bash

LOG_FILE="logs/monitor.log"

echo "System Monitoring Report - $(date)"
echo "-----------------------------------"

echo "Disk Usage:"
df -h

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "Logged-in Users:"
who

echo ""
echo "Top Running Processes:"
top -b -n 1 | head -10

echo "Monitoring executed on $(date)" >> $LOG_FILE
