# Minecraft Bedrock Auto Backup & Installer Script

[![GitHub Repo](https://img.shields.io/badge/GitHub-Repository-000000?style=flat&logo=github&logoColor=white)](https://github.com/Aron0x0)

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
├── WorldsBackup/     # Worlds Backup archives (.tar.gz)
├── autobackup.sh     # Auto Backup Script  for Crontab 
└── command.sh        # Run Command Outside The Minecraft Server Console.
```

---

## 📦 Installation

```bash
chmod +x install.sh
./install.sh
```

---

## 🚀 Parameters

- Start A Screen Before Running The Minecraft Server.
```bash
screen -S bedrock #Always Name it like this
```
- Run Minecraft Server.
```bash
cd $HOME/minecraft/Server
./bedrock_server
```
- To Detach safely:
```bash
# Press Ctrl + A, then D
```
- To Re-Attach Safely:
```bash
screen -ls # Check if the screen is running the 'bedrock'
screen -r bedrockd
```

- Manually Running Backup Worlds
```bash
cd $HOME/minecraft
./autobackup.sh
```

- Crontab Auto Backup
```bash
systemctl status cron #Check if the crontab is running.
systemctl start cron #if cron is NOT running.
systemctl enable cron #Remember If NOT running.  

# Setting Up a time
crontab -l # If you see “no crontab for root” is working fine leave it.
crontab -e # Select what editor u want to use.
# Put this line of code
0 */2 * * * /root/minecraft/autobackup.sh >> /root/minecraft/backup.log 2>&1

# Additional Info
* * * * *  command_to_run
│ │ │ │ │
│ │ │ │ └─ day of the week (0-7, 0 or 7 = Sunday)
│ │ │ └── month (1-12)
│ │ └── day of the month (1-31)
│ └── hour (0-23)
└── minute (0-59)
