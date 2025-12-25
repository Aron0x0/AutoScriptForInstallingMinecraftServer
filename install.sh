#!/bin/bash
set -e

echo "Running AutoScript Installer For Minecraft Bedrock Server"
sleep 3

apt update -y && apt upgrade -y
apt install unzip screen wget -y

MINECRAFT_SERVER_LINK="https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.131.1.zip"

ROOT_DIR="$HOME/minecraft"
SERVER_DIR="$ROOT_DIR/Server"
BACKUP_DIR="$ROOT_DIR/WorldsBackup"

mkdir -p "$SERVER_DIR" "$BACKUP_DIR"

cd "$SERVER_DIR"
wget -O bedrock.zip "$MINECRAFT_SERVER_LINK"
unzip bedrock.zip
rm -f bedrock.zip

cp "$HOME/AutoScriptForInstallingMinecraftServer/autobackup.sh" "$ROOT_DIR/"
cp "$HOME/AutoScriptForInstallingMinecraftServer/command.sh" "$ROOT_DIR/"

chmod +x "$ROOT_DIR"/autobackup.sh "$ROOT_DIR"/command.sh

echo "Installation completed."
