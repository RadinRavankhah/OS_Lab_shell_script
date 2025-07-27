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

