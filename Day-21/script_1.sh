#!/bin/bash

# Log file path
log_file="/var/log/sys_metrics.log"

# Function to check disk usage
check_disk_usage() {
    echo "Checking Disk Usage..." >> $log_file
    disk_usage=$(df -h)
    if [ $? -ne 0 ]; then
        echo "Error: Failed to get disk usage" | tee -a $log_file
        exit 1
    fi
    echo "$disk_usage" >> $log_file
    echo "---------------------------------" >> $log_file
}

# Function to check memory usage
check_memory_usage() {
    echo "Checking Memory Usage..." >> $log_file
    memory_usage=$(free -m)
    if [ $? -ne 0 ]; then
        echo "Error: Failed to get memory usage" | tee -a $log_file
        exit 1
    fi
    echo "$memory_usage" >> $log_file
    echo "---------------------------------" >> $log_file
}

# Function to check CPU load
check_cpu_load() {
    echo "Checking CPU Load..." >> $log_file
    cpu_load=$(uptime)
    if [ $? -ne 0 ]; then
        echo "Error: Failed to get CPU load" | tee -a $log_file
        exit 1
    fi
    echo "$cpu_load" >> $log_file
    echo "---------------------------------" >> $log_file
}

# Main script execution
echo "System Metrics Report - $(date)" >> $log_file
check_disk_usage
check_memory_usage
check_cpu_load
echo "Report Completed" >> $log_file
echo "=================================" >> $log_file
