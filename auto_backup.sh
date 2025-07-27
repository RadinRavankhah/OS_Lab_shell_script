# should be preferably placed in
#!/bin/bash

# Exit on error
set -e

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <backup_directory> <file_extension> [--dry-run] [-encrypt]"
    exit 1
fi


