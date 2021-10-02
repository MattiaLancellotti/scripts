#!/bin/sh
# This file includes some utilities/functions used by other scripts in the
# scripts directory to log messages to the console.

# Normal log function to inform the user about stuff
log()  { [ ${#*} -gt 0 ] && echo "[@@] $1";     }

# Log function to warn the user about something
warn() { [ ${#*} -gt 0 ] && echo "[!!] $1" >&2; }
