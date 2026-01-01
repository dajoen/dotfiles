#!/bin/bash

# Find the default-release profile
PROFILE_DIR=$(find ~/.mozilla/firefox -maxdepth 1 -type d -name "*.default-release" | head -n 1)

if [ -n "$PROFILE_DIR" ]; then
    echo "Installing arkenfox/user.js to $PROFILE_DIR"
    wget -q -O "$PROFILE_DIR/user.js" https://raw.githubusercontent.com/arkenfox/user.js/master/user.js
    
    if [ ! -f "$PROFILE_DIR/user-overrides.js" ]; then
        echo "// user-overrides.js" > "$PROFILE_DIR/user-overrides.js"
        echo "// Put your overrides here." >> "$PROFILE_DIR/user-overrides.js"
        echo "// See: https://github.com/arkenfox/user.js/wiki/3.1-Overrides" >> "$PROFILE_DIR/user-overrides.js"
    fi
fi
