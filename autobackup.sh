#!/bin/bash
set -e

# ========================
# Cron-safe Minecraft Bedrock Backup
# ========================

ROOT_DIR="$HOME/minecraft"
SERVER_DIR="$ROOT_DIR/Server"
BACKUP_DIR="$ROOT_DIR/WorldsBackup"
WORLD_NAME="Bedrock level"
SCREEN_NAME="bedrock"   # your screen session name

mkdir -p "$BACKUP_DIR"

# Check if the Minecraft server is running in screen
if screen -list | grep -q "$SCREEN_NAME"; then
    echo "$(date '+%F %T') - Server is running. Starting backup..."
    
    # Send backup messages to the server console
    ./command.sh say "§6Running World Backup..."
    sleep 2
    ./command.sh say "§4Expect some lag..."
    
    # Save hold before backup
    ./command.sh save hold
    sleep 15
    
    # Create the backup
    tar --warning=no-file-changed -czf \
        "$BACKUP_DIR/bedrock_world_$(date +%F_%H-%M-%S).tar.gz" \
        -C "$SERVER_DIR/worlds" "$WORLD_NAME"
    
    # Resume saving
    ./command.sh save resume
    ./command.sh say "§aBackup Completed Successfully!"
    
    echo "$(date '+%F %T') - Backup Finished Safely."
else
    echo "$(date '+%F %T') - Server is not running. Backup skipped."
fi
