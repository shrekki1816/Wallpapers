#!/bin/bash

# Ordner mit den Hintergrundbildern
WALLPAPER_DIR="$HOME/.config/wallpapers/"

# Prüfen ob swww läuft, sonst starten
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    # ein wenig warten, damit der Daemon sauber startet
    sleep 1
fi

# Zufälliges Bild aus dem Ordner wählen
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# Falls ein Bild gefunden wurde, setzen
if [ -n "$RANDOM_WALLPAPER" ]; then
    swww img "$RANDOM_WALLPAPER" --transition-type any --transition-duration 1
else
    echo "Keine passenden Bilder im Ordner $WALLPAPER_DIR gefunden."
    exit 1
fi
