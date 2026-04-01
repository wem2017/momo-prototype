# UI Composer — Product Design Agent

> Converts Product Brief → SSR JSON Design Specs via LangGraph pipeline (Planner → Retriever → Composer → Validator).

## When Triggered

User asks to design UI: "thiết kế flow...", "compose màn hình...", "tạo design spec cho...", "dùng skill ui composer..."

## Workflow

### Step 1 — Ensure PDA is Ready

Check dependencies. If first time on this machine, run setup:
```bash
cd pda-mvp && python3 -c "import langgraph, anthropic" 2>/dev/null || bash setup.sh
source ~/.zshrc 2>/dev/null
```

### Step 2 — Extract Brief

From the user's message, extract the product brief.
- If user gives a short request → use as-is
- If user attaches/pastes a PRD → extract key info: problem, users, screens, app type

### Step 3 — Run Pipeline

```bash
cd pda-mvp && python3 main.py "{brief}"
```

Wait for all 4 nodes to complete:
- 📋 PLANNER — classify task + decompose screens (Opus)
- 🔍 RETRIEVER — search knowledge bases + Stitch creative references
- 🎨 COMPOSER — compose SSR JSON per screen (Opus)
- ✅ VALIDATOR — schema + component check

Pipeline auto-copies output specs to `design-specs/`.

### Step 4 — Report to User

Read `pda-mvp/output/{latest}/_run_meta.json` and report:
1. Flow summary
2. Screen list (id + name)
3. Validation result (errors/warnings)

Then ask: **"Muốn xem spec chi tiết của màn nào, hay tiếp tục sang code gen?"**

### Step 5 — Phase 3 Code Gen (if user confirms)

```
Use skill design-system-kits to generate code from design-specs/*.json.
Generate the Expo project INSIDE this repo root.
```

## Knowledge Sources

PDA reads from 2 layers — NO need to load anything manually:

| Source | Location | Loaded by |
|---|---|---|
| Component Registry v4 | `COMPONENT-REGISTRY-v4.json` (repo root) | Retriever auto |
| Golden screen examples | `design-specs/*.json` (repo root) | Retriever auto |
| Designer DNA persona | `designer-dna.md` (this skill folder) | Composer prompt |
| Component Templates | `pda-mvp/knowledge/component-templates/` | Retriever auto |
| Screen DB | `pda-mvp/knowledge/screen-db/` | Retriever auto |
| Pattern Library | `pda-mvp/knowledge/pattern-library/` | Retriever auto |
| Stitch creative refs | Google Stitch API (optional) | Retriever auto |

## Error Handling

| Error | Fix |
|---|---|
| `ModuleNotFoundError` | `cd pda-mvp && bash setup.sh && source ~/.zshrc` |
| `ANTHROPIC_API_KEY not set` | Keys hardcoded in setup.sh — run setup again |
| Stitch timeout/error | Non-blocking — pipeline continues with KB only |
| JSON parse error | Read raw output in `pda-mvp/output/` |
| Empty output | Check if `knowledge/` has data — templates, screens, patterns |
