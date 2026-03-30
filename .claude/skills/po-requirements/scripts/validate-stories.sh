#!/bin/bash
# Validate user-stories.yaml has required fields
# Usage: bash .claude/skills/po-requirements/scripts/validate-stories.sh pipeline-output/{runId}/po/user-stories.yaml

FILE=$1
if [ -z "$FILE" ]; then
  echo "Usage: validate-stories.sh <path-to-user-stories.yaml>"
  exit 1
fi

echo "=== Validating $FILE ==="
ERRORS=0

check() {
  if ! grep -q "$1" "$FILE"; then
    echo "❌ Missing field: $1"
    ERRORS=$((ERRORS+1))
  else
    echo "✅ Found: $1"
  fi
}

check "id:"
check "title:"
check "given:"
check "when:"
check "then:"
check "complexity:"

if [ $ERRORS -gt 0 ]; then
  echo "❌ $ERRORS validation error(s) found"
  exit 1
else
  echo "✅ All required fields present"
fi
