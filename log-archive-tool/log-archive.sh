# z returns true if the first argument is empty
if [ -z "$1" ]; then
	echo "Usage: $0 <log-directory>"
	exit 1
fi

LOG_DIR="$1"
ARCHIVE_DIR="$LOG_DIR/archives"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_$TIMESTAMP.tar.gz"
ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_NAME"
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"

mkdir -p "$ARCHIVE_DIR"

tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .
if [ $? -ne 0 ]; then
	echo "Error: Failed to create archive."
	exit 1
fi

echo "Archived logs on $(date +"%Y-%m-%d %H:%M:%S") to $ARCHIVE_NAME" >> "$LOG_FILE"
echo "Logs successfully archived to $ARCHIVE_PATH"
exit 0
