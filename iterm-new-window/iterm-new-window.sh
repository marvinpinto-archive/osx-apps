#!/bin/bash

/usr/bin/osascript<<EOF
  tell application "/Applications/iTerm.app"
    set myterm to (make new terminal)
    tell myterm
      set number of columns to 100
      set number of rows to 32
      launch session "Default"
    end tell
    activate
  end tell
EOF

