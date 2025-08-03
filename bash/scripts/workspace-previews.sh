#!/usr/bin/env bash

SCREENSHOT_DIR="$HOME/stuff/pictures/workspace-previews"
mkdir -p "$SCREENSHOT_DIR"

# Debug: Verify we can write to the directory
touch "$SCREENSHOT_DIR/testfile" 2>/dev/null && rm "$SCREENSHOT_DIR/testfile" || {
    echo "❌ Cannot write to $SCREENSHOT_DIR"
    exit 1
}

PREV_WS=$(hyprctl activeworkspace -j | jq -r '.id')
while true; do
    CURRENT_WS=$(hyprctl activeworkspace -j | jq -r '.id')
    
    if [[ "$CURRENT_WS" != "$PREV_WS" ]]; then
        echo "🔄 Workspace changed to $CURRENT_WS"
        
        # Take screenshot directly to final filename
        FINAL_FILE="$SCREENSHOT_DIR/${CURRENT_WS}.png"
        OLD_MD5=$(md5sum "$FINAL_FILE" 2>/dev/null | cut -d' ' -f1)

        hyprshot -m active --mode output -o "$SCREENSHOT_DIR" -f "${CURRENT_WS}.png" 2>/dev/null --silent;
        
        # Verify capture succeeded
        if [[ -f "$FINAL_FILE" ]]; then
            echo "✅ Successfully saved $FINAL_FILE"
        else
            echo "⚠️ All capture methods failed for workspace $CURRENT_WS"
            # Debug: List directory contents
            echo "Directory contents:"
            ls -la "$SCREENSHOT_DIR" || echo "Could not list directory"
        fi
        
        PREV_WS=$CURRENT_WS
    fi
    
    sleep 1
done
