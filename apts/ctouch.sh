#!/bin/bash

script_name="$1"
# Check if a script name was provided
if [ -z "$script_name" ]; then
	echo "A script name was not provided."
	echo "Example: ctouch my_script_name"
	exit 1
fi

# Check if a similar script name already exists
if [ -e "$script_name" ]; then
	echo "A script with that name already exists."
	echo "Please enter a unique script name that won't interfere with files in your working directory."
	exit 1
fi

# Create file
if touch "$script_name"; then
	if chmod +x "$script_name"; then
		exit 1
	else
		echo "ERROR: Unable to turn script into an executable."
	fi
else
	echo "ERROR: Unable to create file."
	exit 1
fi

