
# 🗄️ Linux Backup Automation Script

A Bash-based backup automation script for Linux that supports filtering by file extension, compression, dry-run mode, optional encryption, automatic cleanup, logging, and email notification.

## 🛠️ Features

- ✅ Backup all files with a specific extension from a predefined directory
- 📦 Compresses results into a `.tar.gz` archive
- 🧪 Supports `--dry-run` mode to preview files before backup
- 🔐 Optional AES256 encryption using GPG
- 🧹 Deletes old backups (older than 7 days)
- 📝 Logs backup info (size, time, archive name)
- 📧 Sends an email on successful backup

