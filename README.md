
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

## 📋 How it Works

1. Searches `/home/radin/Desktop` for files with the specified extension.
2. Lists them in `backup.conf`.
3. If `--dry-run` is used, it just prints the list and exits.
4. Otherwise:

   * Compresses the files into `backup_<timestamp>.tar.gz`
   * Logs the backup info in `backup.log`
   * Deletes old backups (> 7 days)
   * Optionally encrypts the archive with GPG if `-encrypt` is used
   * Sends an email notification (editable)

