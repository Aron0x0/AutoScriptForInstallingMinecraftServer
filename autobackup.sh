#!/bin/bash
set -e

echo "Backup Script Started"

ROOT_DIR="$HOME/minecraft"
SERVER_DIR="$ROOT_DIR/Server"
BACKUP_DIR="$ROOT_DIR/WorldsBackup"
WORLD_NAME="Bedrock level"
CMD="$ROOT_DIR/command.sh"
mkdir -p "$BACKUP_DIR"

$CMD say "§6Running World Backup..."
sleep 5
$CMD say "§4Expect some lag..."
sleep 1
$CMD save hold

sleep 15

tar --warning=no-file-changed -czf \
"$BACKUP_DIR/bedrock_world_$(date +%F_%H-%M-%S).tar.gz" \
-C "$SERVER_DIR/worlds" "$WORLD_NAME"
sleep 1

$CMD save resume
$CMD say "§aBackup Completed Successfully!"
sleep 1

echo "Backup Finished Safely."