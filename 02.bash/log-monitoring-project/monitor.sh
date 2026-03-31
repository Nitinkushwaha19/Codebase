#!/bin/bash

set -e

source ./config.conf

mkdir -p "$REPORT_DIR" "$ARCHIVE_DIR" "$STATE_DIR"

STATE_FILE="$STATE_DIR/monitor.state"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="$REPORT_DIR/report_$DATE.txt"

# Validate log file
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file does not exist!"
    exit 1
fi

# Get total lines in log
TOTAL_LINES=$(wc -l < "$LOG_FILE")

# Get last processed line
if [ -f "$STATE_FILE" ]; then
    LAST_LINE=$(cat "$STATE_FILE")
else
    LAST_LINE=0
fi

# Handle log rotation case
if [ "$LAST_LINE" -gt "$TOTAL_LINES" ]; then
    LAST_LINE=0
fi

# Extract new logs only
NEW_LOGS=$(tail -n +"$((LAST_LINE + 1))" "$LOG_FILE")

# Count levels from new logs only
ERROR_COUNT=$(echo "$NEW_LOGS" | grep -c "ERROR" || true)
WARNING_COUNT=$(echo "$NEW_LOGS" | grep -c "WARNING" || true)
CRITICAL_COUNT=$(echo "$NEW_LOGS" | grep -c "CRITICAL" || true)

# Write report
{
echo "======================================"
echo "     LOG MONITORING REPORT"
echo "     Generated: $DATE"
echo "======================================"
echo ""
echo "New Log Entries Processed: $((TOTAL_LINES - LAST_LINE))"
echo ""
echo "Error Count    : $ERROR_COUNT"ls
echo "Warning Count  : $WARNING_COUNT"
echo "Critical Count : $CRITICAL_COUNT"
echo ""
} > "$REPORT_FILE"

ALERT_FLAG=false

if [ "$ERROR_COUNT" -gt "$ERROR_THRESHOLD" ]; then
    echo "⚠ ERROR threshold exceeded!" >> "$REPORT_FILE"
    ALERT_FLAG=true
fi

if [ "$WARNING_COUNT" -gt "$WARNING_THRESHOLD" ]; then
    echo "⚠ WARNING threshold exceeded!" >> "$REPORT_FILE"
    ALERT_FLAG=true
fi

if [ "$CRITICAL_COUNT" -ge "$CRITICAL_THRESHOLD" ]; then
    echo "🚨 CRITICAL issue detected!" >> "$REPORT_FILE"
    ALERT_FLAG=true
fi

# Save current line position
echo "$TOTAL_LINES" > "$STATE_FILE"

# Optional email alert
if [ "$ALERT_FLAG" = true ] && [ "$ENABLE_EMAIL_ALERT" = true ]; then
    cat "$REPORT_FILE" | mail -s "Log Alert - $DATE" "$EMAIL"
fi

echo "Monitoring completed safely!"