---
tags: code, convention, formatting, style, lint, developer
related:
---

# Code Convention

Apply this convention to every AI-generated code output.

## Scope and Consistency

1. Use this document as the single source of truth for code-related skills.
2. Any copied code-convention reference in other skills must be identical to this file.
3. Apply header and marker requirements only to newly generated files or newly generated code blocks.
4. Do not add markers/header to unchanged existing code.

## 0) File Size and Line Width

1. Keep each source file under about 500 lines.
2. Enforce max line length (column width) of 120.
3. If a file would exceed 500 lines, split by feature/module while preserving behavior.

## 0.1) React Native — useCallback Rules

**Never use `useCallback` for**:
- `navigator.push()`, `navigator.pop()`, `navigator.showModal()`, `navigator.showBottomSheet()`
- Simple event handlers that don't affect child component renders
- One-off callbacks that aren't memoization dependencies

## 1) Required File Header

Add a file header at the top of each newly generated code file with:

1. `File`
2. `Created At` (ISO-like timestamp with timezone)
3. `Created By` (`AI`)
4. `AI Agent`
5. `Model`

Template:

```txt
<COMMENT_OPEN>
File: <relative-or-file-name>
Created At: <YYYY-MM-DD HH:mm:ss Z>
Created By: AI
AI Agent: <agent-name>
Model: <model-id>
<COMMENT_CLOSE>
```

Language examples:

```js
/*
File: src/example.js
Created At: 2026-03-10 12:30:00 +07:00
Created By: AI
AI Agent: Codex
Model: gpt-5
*/
```

```py
# File: src/example.py
# Created At: 2026-03-10 12:30:00 +07:00
# Created By: AI
# AI Agent: Codex
# Model: gpt-5
```

## 2) Required AI Block Markers

Wrap every newly generated AI code block:

- Start marker: `AI-GENERATED START`
- End marker: `AI-GENERATED END`
- Include short purpose text.

JavaScript / TypeScript:

```js
// AI-GENERATED START: build payment retry helper
function retryPayment() {
  // ...
}
// AI-GENERATED END: build payment retry helper
```

Python:

```py
# AI-GENERATED START: parse webhook payload
def parse_webhook(payload):
    return payload
# AI-GENERATED END: parse webhook payload
```

HTML / XML:

```html
<!-- AI-GENERATED START: login form -->
<form></form>
<!-- AI-GENERATED END: login form -->
```

CSS:

```css
/* AI-GENERATED START: card layout */
.card { display: grid; }
/* AI-GENERATED END: card layout */
```

## 3) Enforcement Checklist

Before returning output, verify:

1. File header exists at top of each newly generated file.
2. Header includes filename, timestamp, AI creator, agent, and model.
3. Every newly generated code block has start and end markers.
4. Marker comment style matches target language.
5. Unchanged existing code was not backfilled with new markers/header.
6. New or modified files stay within ~500 lines.
7. New or modified lines do not exceed 120 columns unless unavoidable.
