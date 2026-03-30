#!/bin/bash
# Fires when Claude Code needs input or finishes a long task
# Sends a desktop notification (macOS)

TITLE="Claude Code"
MSG="${NOTIFICATION_MESSAGE:-Claude needs your attention}"

if command -v osascript &> /dev/null; then
  osascript -e "display notification \"$MSG\" with title \"$TITLE\""
elif command -v notify-send &> /dev/null; then
  notify-send "$TITLE" "$MSG"
fi

exit 0
