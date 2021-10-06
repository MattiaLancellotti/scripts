#!/bin/sh
# This file has usefull functions to interact with the operating system.

# This function checks whether a command is installed or not.
check_command() { command -v "$1" 1> /dev/null; }

# This functions should be used when the script needs to print an error
# message and die. It accepts as first parameter the exit message and the exit
# code as the second one.
die_on_error() { echo "$1" >&2; exit $2; }
