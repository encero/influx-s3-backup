#!/bin/bash

set -euo pipefail

BACKUP_DIR="/var/backup"

: ${INFLUXDB_HOST:?"INFLUXDB_HOST env variable is required"}
: ${INFLUXDB_TOKEN:?"INFLUXDB_TOKEN env variable is required"}

: ${BUCKET_NAME:?"BUCKET_NAME env variable is required"}
: ${AWS_SECRET_ACCESS_KEY:?"AWS_SECRET_ACCESS_KEY env variable is required"}
: ${AWS_ACCESS_KEY_ID:?"AWS_ACCESS_KEY_ID env variable is required"}

BACKUP_TIME=$(date -u +"%Y-%m-%dT%H:%M:%S")

[ -d "${BACKUP_DIR}" ] || mkdir "${BACKUP_DIR}"

echo "Starting influx db backup process..."
influx backup \
    --host "${INFLUXDB_HOST}" \
    --token "${INFLUXDB_TOKEN}" \
    "${BACKUP_DIR}"

echo "Backup done, total backed up size $(du -sh /var/backup | cut -f0 )"
echo "Starting S3 upload to ${BUCKET_NAME}"
aws s3 cp --recursive "${BACKUP_DIR}" "s3://${BUCKET_NAME}/${BACKUP_TIME}"
echo "Finished..."




