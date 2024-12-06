#!/bin/bash

execute() {

}

while true; do
    # Get the current time in seconds since epoch
    current_time=$(date +%s)
    
    # Get the current date and time, and set the target time (today at 21:00)
    target_time=$(date -d '21:00' +%s)

    # If the current time is past 21:00 today, set the target to 21:00 tomorrow
    if [ $current_time -ge $target_time ]; then
        target_time=$(date -d 'tomorrow 21:00' +%s)
    fi

    # Calculate the sleep duration in seconds
    sleep_duration=$((target_time - current_time))
    
    # Sleep until 21:00
    echo "Sleeping for $sleep_duration seconds until 21:00"
    sleep $sleep_duration
    
    # Execute your desired script or command
    echo "Running the script at 21:00"
    execute
done
