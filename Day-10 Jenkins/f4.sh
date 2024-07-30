#!/bin/bash
REPORT_FILE="/var/log/system_report.txt"
# Check status of essential services
SERVICES=("apache2" "mysql")
echo "Health Checks:" | tee -a $REPORT_FILE
for service in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "$service is running." | tee -a $REPORT_FILE
    else
        echo "$service is NOT running." | tee -a $REPORT_FILE
    fi
done

# Verify connectivity to external services or databases
echo "Connectivity Checks:" | tee -a $REPORT_FILE
ping -c 3 http://localhost/ > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Connectivity to localhost is successful." | tee -a $REPORT_FILE
else
    echo "Connectivity to localhost failed." | tee -a $REPORT_FILE
fi

