#!/bin/sh
# This file has usefull functions to interact with the operating system.

# This function checks whether a command is installed or not.
check_command() { command -v "$1" 1> /dev/null; }
