#!/bin/bash
LOG_FILE="/var/log/system_monitor.log"
REPORT_FILE="/var/log/system_report.txt"

# Implement thresholds for critical metrics
CPU_THRESHOLD=90
MEMORY_THRESHOLD=90

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
memory_usage=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')

if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
    echo "CPU usage is above threshold ($cpu_usage%). Sending alert." | tee -a $LOG_FILE
else
    echo "CPU usage is below threshold($cpu_usage%)"
fi

if (( $(echo "$memory_usage > $MEMORY_THRESHOLD" | bc -l) )); then
    echo "Memory usage is above threshold ($memory_usage%). Sending alert." | tee -a $LOG_FILE
else
    echo "Memory usage is below threshold($memory_usage%)"
fi
