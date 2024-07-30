REPORT_FILE="/var/log/system_report.txt"
# Collect CPU usage
echo "CPU Usage:" | tee -a $REPORT_FILE
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 "%"}' | tee -a $REPORT_FILE

# Collect memory usage
echo "Memory Usage:" | tee -a $REPORT_FILE
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }' | tee -a $REPORT_FILE

# Collect disk usage
echo "Disk Space Usage:" | tee -a $REPORT_FILE
df -h | grep -E '^/dev/root|^/dev/sd' | awk '{ print $5 " of " $1 " is used." }' | tee -a $REPORT_FILE

# Collect network statistics
echo "Network Statistics:" | tee -a $REPORT_FILE
netstat -i | tee -a $REPORT_FILE

# Capture process information
echo "Top Processes:" | tee -a $REPORT_FILE
ps aux --sort=-%mem | head -n 10 | tee -a $REPORT_FILE
