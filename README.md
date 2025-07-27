
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

## 🚀 Usage

```bash
./backup.sh <backup_directory> <file_extension> [--dry-run | -encrypt]
```

### 🔸 Examples

✅ Backup all `.txt` files:

```bash
./backup.sh /home/radin/backups txt
```

✅ Dry run – show what will be backed up:

```bash
./backup.sh /home/radin/backups txt --dry-run
```

✅ Backup with encryption:

```bash
./backup.sh /home/radin/backups txt -encrypt
```

