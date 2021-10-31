#!/bin/sh
# This file includes some utilities/functions used by other scripts in the
# scripts directory to log messages to the console.

# Normal log function to inform the user about stuff
log()  { [ ${#*} -gt 0 ] && echo ":: $1";     }

# Log function to warn the user about something
warn() { [ ${#*} -gt 0 ] && echo "!! $1" >&2; }

# This functions should be used when the script needs to print an error
# message and die. It accepts as first parameter the exit message and the exit
# code as the second one.
die_on_error() { [ ${#*} -gt 0 ] && echo "!! $1" >&2; exit $2; }
