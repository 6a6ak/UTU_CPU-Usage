#!/bin/bash
# Define the colors for the blue background and white text
bg_color='\033[44m' # blue background
text_color='\033[97m' # white text
while true; do
    # Get the CPU usage as a percentage and format it as a two-digit number
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.0f\n", $2 + $4}')
    # Define an array with the characters to be displayed
    chars=( "⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏" )
    # Loop through the array and display each character for one second
    for char in "${chars[@]}"; do
        # Clear the current line before displaying the new content
        printf "\r"
        # Display the new character
        printf " $char"
        # Display the CPU usage with a blue background and no newline
        printf "${bg_color}${text_color} CPU Usage: %s%% ${text_color}" "$cpu_usage"
      
        # Wait for one second before displaying the next character
        sleep 0.1
    done
done
