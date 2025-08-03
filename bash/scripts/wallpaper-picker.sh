#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/stuff/pictures/backgrounds"
PREVIEW_IMG="$HOME/.cache/fzf_wallpaper_preview.jpg"
DEBOUNCE_FILE="/tmp/fzf_wallpaper_debounce"

# Gather wallpapers (only files with proper extensions)
mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.gif' \) -printf '%f\n' | sort)

clear

cleanup() {
    # Kill feh preview if running
    pkill -f "feh --title fzf-wallpaper-preview" 2>/dev/null
    # Remove preview image symlink
    rm -f "$PREVIEW_IMG"
    rm -f "$DEBOUNCE_FILE"
}
trap cleanup EXIT

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Initialize preview image symlink with the first wallpaper
ln -sf "$WALLPAPER_DIR/${WALLPAPERS[0]}" "$PREVIEW_IMG"

# Start feh preview window in background with reload every 1 second and flags for stability
feh --title fzf-wallpaper-preview --geometry 1150x650+650+250 --scale-down --image-bg black --reload 1 --no-menus "$PREVIEW_IMG" &
FEH_PID=$!

preview_cmd() {
    local imgname="$1"
    local src="$WALLPAPER_DIR/$imgname"

    if [ ! -f "$src" ]; then
        echo "File not found: $src" >&2
        return
    fi

    # Debounce logic: only update if 200ms have passed since last update
    local now=$(date +%s%3N)  # current time in milliseconds
    if [ -f "$DEBOUNCE_FILE" ]; then
        local last_update
        last_update=$(cat "$DEBOUNCE_FILE")
        local diff=$((now - last_update))
        if (( diff < 200 )); then
            # Too soon, skip updating preview
            return
        fi
    fi

    # Update symlink to new image for feh preview
    ln -sf "$src" "$PREVIEW_IMG"

    # Record timestamp of this update
    echo "$now" > "$DEBOUNCE_FILE"
}

export -f preview_cmd
export WALLPAPER_DIR
export PREVIEW_IMG
export DEBOUNCE_FILE

selected=$(printf '%s\n' "${WALLPAPER_DIR}/${WALLPAPERS[@]}" | xargs -n1 basename | fzf \
    --height=100% --border --prompt=" Choose wallpaper: " \
    --preview "bash -c 'preview_cmd {}'" \
    --preview-window=right:0%:wrap \
    --bind "enter:accept" \
    --cycle)

if [ -z "$selected" ]; then
    cleanup
    exit 0
fi

swww img "$WALLPAPER_DIR/$selected" --transition-type grow --transition-pos 950,0 --transition-step 255 --transition-fps 60 --transition-duration 2.5

echo "$WALLPAPER_DIR/$selected" > ~/.cache/current-swww-img

cleanup
