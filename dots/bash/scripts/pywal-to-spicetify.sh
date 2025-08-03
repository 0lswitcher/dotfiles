#!/bin/bash

WAL_COLORS="$HOME/.cache/wal/colors.json"
COLOR_INI="$HOME/.config/spicetify/Themes/text/color.ini"  # update with your actual path
SECTION="[Pywal]"

# Extract colors from pywal
accent=$(jq -r '.colors.color2' "$WAL_COLORS" | sed 's/#//')
main=$(jq -r '.special.background' "$WAL_COLORS" | sed 's/#//')
text=$(jq -r '.special.foreground' "$WAL_COLORS" | sed 's/#//')
subtext=$(jq -r '.colors.color7' "$WAL_COLORS" | sed 's/#//')
notification=$(jq -r '.colors.color4' "$WAL_COLORS" | sed 's/#//')
notification_error=$(jq -r '.colors.color1' "$WAL_COLORS" | sed 's/#//')
highlight=$(jq -r '.colors.color8' "$WAL_COLORS" | sed 's/#//')
header=$(jq -r '.colors.color0' "$WAL_COLORS" | sed 's/#//')
border=$(jq -r '.colors.color3' "$WAL_COLORS" | sed 's/#//')

# Generate the [Pywal] section
cat <<EOF > /tmp/pywal_spicetify.ini
$SECTION
accent             = ${accent}
accent-active      = ${accent}
accent-inactive    = ${main}
banner             = ${accent}
border-active      = ${accent}
border-inactive    = ${border}
header             = ${header}
highlight          = ${highlight}
main               = ${main}
notification       = ${notification}
notification-error = ${notification_error}
subtext            = ${subtext}
text               = ${text}
EOF

# Remove existing [Pywal] section if it exists
sed -i '/^\[Pywal\]/,/^\[.*\]/d' "$COLOR_INI"

# Append new [Pywal] section
cat /tmp/pywal_spicetify.ini >> "$COLOR_INI"

# Optionally set the color scheme and apply
spicetify config color_scheme Pywal
spicetify apply

