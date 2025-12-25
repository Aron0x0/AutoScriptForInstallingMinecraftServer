#!/bin/bash
set-e
echo "Running AutoScript Installer For Minecraft Bedrock Server"
sleep 5
#sudo su -? Uncomment this if your running on admin privilege
apt update -y && apt upgrade -y
apt install unzip -y
apt install screen -y

REPO_AUTOSCRIPT="https://github.com/Aron0x0/AutoScriptForInstallingMinecraftServer.git"
MINECRAFT_SERVER_LINK="https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.131.1.zip"

ROOT_DIR="$HOME/minecraft"
SERVER_DIR="$ROOT_DIR/Server"
BACKUP_DIR="$ROOT_DIR/WorldsBackup"

mkdir -p "$ROOT_DIR"
mkdir -p "$SERVER_DIR"
mkdir -p "$BACKUP_DIR"

cd $SERVER_DIR
wget -O bedrock.zip $MINECRAFT_SERVER_LINK

unzip bedrock.zip
rm -rf bedrock.zip

cd $ROOT_DIR/AutoScriptForInstallingMinecraftServer

mv $ROOT_DIR/AutoScriptForInstallingMinecraftServer/autobackup.sh $ROOT_DIR
mv $ROOT_DIR/AutoScriptForInstallingMinecraftServer/command.sh $ROOT_DIR

chmod +x autobackup.sh
chmod +x command.sh