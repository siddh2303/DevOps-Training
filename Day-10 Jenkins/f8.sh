#!/bin/bash
 
# Function to display CPU usage
check_cpu() {
    echo "Checking CPU usage..."
    top -bn1 | grep "Cpu(s)"
}
 
# Function to display memory utilization
check_memory() {
    echo "Checking memory utilization..."
    free -h
}
 
# Function to display disk space
check_disk() {
    echo "Checking disk space..."
    df -h
}
 
# Function to display network statistics
check_network() {
    echo "Checking network statistics..."
    ifstat -i eth0 1 1
}
 
# Function to display the menu
display_menu() {
    echo "System Monitoring Menu"
    echo "1. Check CPU Usage"
    echo "2. Check Memory Utilization"
    echo "3. Check Disk Space"
    echo "4. Check Network Statistics"
    echo "5. Exit"
    echo -n "Choose an option [1-5]: "
}
 
# Main loop
while true; do
    display_menu
    read -r option
 
    case $option in
        1)
            check_cpu
            ;;
        2)
            check_memory
            ;;
        3)
            check_disk
            ;;
        4)
            check_network
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a number between 1 and 5."
            ;;
    esac
 
    echo
done


