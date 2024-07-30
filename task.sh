#!/bin/bash

echo "Enter an hour (00:00 to 23:59): "
read input_hour

validate_hour() {

    local regex="^([01]?[0-9]|2[0-3]):[0-5][0-9]$"
    if [[ $1 =~ $regex ]]; then
        return 0
    else
        return 1
    fi
}


categorize_time() {
    local hour=$1

    if [[ "$hour" > "00:00" && "$hour" < "06:00" ]]; then
        echo "Early Morning"
    elif [[ "$hour" > "06:01" && "$hour" < "12:00" ]]; then
        echo "Morning"
    elif [[ "$hour" > "12:01" && "$hour" < "18:00" ]]; then
        echo "Afternoon"
    elif [[ "$hour" > "18:01" && "$hour" <= "23:59" ]]; then
        echo "Late Night"
    else
        echo "Invalid hour entered."
    fi
}



if validate_hour "$input_hour"; then
    time_category=$(categorize_time "$input_hour")
    echo "Time category for $input_hour is: $time_category"
else
    echo "Invalid input. Please enter a valid hour in 24-hour format (HH:MM)."
fi
