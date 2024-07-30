#!/bin/bash

# Configuration
LOG_FILE="/var/log/system_monitor.log"
REPORT_FILE="/var/log/system_report.txt"
EMAIL="siddh.patel@einfochips.com"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Validate required commands and utilities
REQUIRED_COMMANDS=("top" "df" "free" "awk" "grep" "mail" "systemctl")
for cmd in "${REQUIRED_COMMANDS[@]}"; do
    if ! command_exists "$cmd"; then
        echo "Error: $cmd is not installed." | tee -a $LOG_FILE
        exit 1
    fi
done

echo "All required commands are available." | tee -a $LOG_FILE

