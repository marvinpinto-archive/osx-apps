#!/bin/bash

# This appears to launch two chrome windows the very first time it is invoked.
# Not really something I feel like solving now. Pull requests welcome!

/usr/bin/osascript<<EOF
  tell application "/Applications/Google Chrome.app"
    make new window
    activate
  end tell
EOF
