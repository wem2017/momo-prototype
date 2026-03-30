#!/bin/bash
# Runs before every Bash tool call
# Blocks dangerous commands silently

CMD="${TOOL_INPUT_COMMAND:-}"

# Block force push to main
if echo "$CMD" | grep -q "git push --force\|git push origin main"; then
  echo '{"block": true, "message": "Direct push to main is blocked. Create a PR instead."}' >&2
  exit 2
fi

# Block writing to pipeline-output directly
if echo "$CMD" | grep -q "pipeline-output/"; then
  echo '{"block": true, "message": "Do not write to pipeline-output/ directly. Use writeOutput() from src/shared/file-io.ts"}' >&2
  exit 2
fi

exit 0
