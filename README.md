# Minecraft Bedrock Auto Backup & Installer Script

This project provides a simple **auto installer**, **command helper**, and **world backup script** for a Minecraft Bedrock Dedicated Server running on Linux.

Designed for **screen-based servers** (VPS, AWS EC2, Debian/Ubuntu).

---

## 📦 Features

- Automated Bedrock server installation
- Safe world backups using `save hold`
- Timestamped `.tar.gz` backups
- Sends in-game messages during backup
- Works with `screen`

---

## 🛠 Requirements

- Debian / Ubuntu
- Root or sudo access
- Internet connection
- `screen` session running the Bedrock server

---

## 📁 Folder Structure

```text
$HOME/minecraft/
├── Server/           # Bedrock server files
├── worlds/           # World data
├── WorldsBackup/     # Backup archives (.tar.gz)
├── autobackup.sh
└── command.sh

## 📦 Installtion
```bash
chmod +x install.sh
./install.sh
```