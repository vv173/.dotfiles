#!/bin/sh

source_dir="/home/vv173/MEGA/PassBackup/"
destination_dir="/home/vv173/.keepass"
log_file="/var/log/keepass_backup.log"

set -x

logger -t "keepass_backup" -p user.info "Backup script started."

echo "! -- $(date +"%d-%m-%Y %H:%M:%S")" >> ${log_file}

/usr/bin/rsync -av "$source_dir" "$destination_dir" >> ${log_file} 2>&1

logger -t "keepass_backup" -p user.info "Backup script ended."
