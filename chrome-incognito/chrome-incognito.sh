#!/bin/bash

# Similar to chrome-new-window, this app does weird things like launch multiple
# windows if chrome is not already launched. Again, not something I intend to
# solve soon. Pull requests welcome!

/usr/bin/osascript<<EOF
  tell application "/Applications/Google Chrome.app"
    make new window with properties {mode:"incognito"}
    activate
  end tell
EOF
