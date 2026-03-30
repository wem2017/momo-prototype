#!/bin/bash
# Run all 5 QA gates and print a summary table
# Usage: bash .claude/skills/qa-validation/scripts/run-all-gates.sh

PASS=0; FAIL=0; TABLE=""

gate() {
  local name=$1; local cmd=$2
  echo ""; echo "--- $name ---"
  if eval "$cmd" > /tmp/gate.txt 2>&1; then
    echo "✅ PASS"; TABLE="$TABLE\n| $name | PASS | — |"; PASS=$((PASS+1))
  else
    echo "❌ FAIL"; head -5 /tmp/gate.txt
    TABLE="$TABLE\n| $name | FAIL | see above |"; FAIL=$((FAIL+1))
  fi
}

gate "Lint"       "npm run lint --silent"
gate "Type-check" "npx tsc --noEmit"
gate "Tests"      "npm run test -- --run --silent"
gate "Build"      "npm run build --silent"
gate "Security"   "npm audit --audit-level high"

echo ""; echo "================================"
echo "$PASS passed · $FAIL failed"
printf "\n| Gate | Result | Notes |\n|---|---|---|\n$TABLE\n"
[ $FAIL -gt 0 ] && exit 1 || exit 0
