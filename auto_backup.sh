# should be preferably placed in
#!/bin/bash

# Exit on error
set -e

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <backup_directory> <file_extension> [--dry-run] [-encrypt]"
    exit 1
fi


# Arguments
BACKUP_DIR=$1
FILE_EXT=$2
DAYS_TO_KEEP=7
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
DEST="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
CONF_FILE="backup.conf"
LOG_FILE="backup.log"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"
echo "Searching for *.$FILE_EXT files..."

find /home/radin/Desktop -type f -name "*.$FILE_EXT" 2>/dev/null > $CONF_FILE


if [[ $3 == "--dry-run" ]]; then
    echo "Dry run: would backup the following files:"
    cat $CONF_FILE
    exit 0
fi

echo "Creating archive at $DEST..."
START_TIME=$(date +%s)

tar -czf "$DEST" -T $CONF_FILE

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
SIZE=$(du -sh "$DEST" | cut -f1)


echo "$TIMESTAMP Backup completed: $DEST | Size: $SIZE | Duration: ${DURATION}s" >> $LOG_FILE

find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +$DAYS_TO_KEEP -exec rm {} \;


echo "Backup finished successfully: $DEST" | mail -s "Backup Success" radin1383rvn@gmail.com


if [[ $3 == "-encrypt" ]]; then
    gpg --symmetric --cipher-algo AES256 "$DEST"
    rm "$DEST"
    exit 0
fi
