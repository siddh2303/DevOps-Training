REPORT_FILE="/var/log/system_report.txt"
# Parse system logs for critical events
echo "Log Analysis:" | tee -a $REPORT_FILE
grep -i 'error\|critical\|alert' /var/log/syslog | tail -n 20 | tee -a $REPORT_FILE
