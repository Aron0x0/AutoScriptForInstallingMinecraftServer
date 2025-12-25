#!/bin/bash
set -e

echo "Backup Script Started"

ROOT_DIR="$HOME/minecraft"
BACKUP_DIR="$ROOT_DIR/WorldsBackup"
WORLD_NAME="Bedrock level"

mkdir -p "$BACKUP_DIR"

./command.sh say "§6Running World Backup..."
sleep 2
./command.sh say "§4Expect some lag..."
./command.sh save hold

sleep 15

tar --warning=no-file-changed -czf \
"$BACKUP_DIR/bedrock_world_$(date +%F_%H-%M-%S).tar.gz" \
-C "$ROOT_DIR/worlds" "$WORLD_NAME"

./command.sh save resume
./command.sh say "§aBackup Completed Successfully!"

echo "Backup Finished Safely."
