#!/bin/bash
# Runs after every Write tool call
# Auto-checks TypeScript files for convention violations

FILE="${TOOL_INPUT_PATH:-}"

# Only check .ts files in src/
if [[ "$FILE" == src/*.ts ]] || [[ "$FILE" == src/**/*.ts ]]; then
  echo "[hook] Checking conventions on $FILE..."
  bash .claude/skills/code-development/scripts/check-conventions.sh "$FILE" 2>&1 | tail -6
fi

exit 0
