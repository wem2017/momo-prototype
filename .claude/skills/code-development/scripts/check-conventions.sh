#!/bin/bash
# Check a .ts file for common convention violations
# Usage: bash .claude/skills/code-development/scripts/check-conventions.sh src/agents/po/new-agent.ts

FILE=$1
[ -z "$FILE" ] && echo "Usage: check-conventions.sh <filepath>" && exit 1

echo "=== Checking $FILE ==="
ISSUES=0

check_bad() {
  if grep -n "$1" "$FILE" 2>/dev/null; then
    echo "❌ VIOLATION: $2"
    ISSUES=$((ISSUES+1))
  else
    echo "✅ OK: $2"
  fi
}

check_bad "export default" "No default exports — use named exports"
check_bad "console\.log" "No console.log — use logger"
check_bad ": any" "No any types"
check_bad "from '@anthropic-ai/sdk'" "Use shared llm.ts not SDK directly"
check_bad "import.*Anthropic" "Use shared llm.ts not SDK directly"

echo "=== $ISSUES issue(s) found ==="
[ $ISSUES -gt 0 ] && exit 1 || exit 0
