#!/bin/bash
LOG_FILE="/var/log/system_monitor.log"
REPORT_FILE="/var/log/system_report.txt"
# Generate a detailed report
echo "Generating report..." | tee -a $LOG_FILE
cat $REPORT_FILE 

