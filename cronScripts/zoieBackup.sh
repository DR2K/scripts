#!/bin/bash

# Check if the session exists, discarding output
# We can check $? for the exit status (zero for success, non-zero for failure)
tmux -S "/var/tmux_sessions/zoie" has-session 2>/dev/null

if [ $? != 1 ]; then
  /etc/cronScripts/backup.sh -s zoie -i /home/Servers/Zoieee/ -o /home/Servers/backups/zoie -m 256
fi
