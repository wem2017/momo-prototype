# AI Feature Pipeline

Automated feature delivery: PO brief → PRD → Design Spec JSON → Code + Preview.

## Project purpose
3 AI agent stages replace the manual PO/Design/Dev workflow.
Human PO provides a brief; pipeline outputs production-ready code with live preview.

## Pipeline flow
```
Stage 1: PO Agent          → PRD, user stories, task graph
         (po-orchestrator)    uses: po-requirements skill
              ↓
Stage 2: Design Agent       → Design Spec JSON per screen
         (design-specialist)  uses: ui-composer skill
              ↓
Stage 3: Dev Agent          → React Native code + live preview
         (dev-engineer)       uses: design-system-kits skill
```

## Tech stack
- Node.js 20 + TypeScript strict
- Anthropic SDK (claude-sonnet-4-20250514)
- React Native (Expo) for UI output
- MoMo KitX design system (@momo-kits/*)
- Vitest for testing · ESLint + Prettier for linting
- File-based pipeline state in pipeline-output/{runId}/

## Key commands
```bash
npm run pipeline "feature brief"   # full 3-stage run
npm run po "brief"                 # Stage 1 only
npm run design "prd-path"          # Stage 2 only
npm run dev "spec-path"            # Stage 3 only
npm run test                       # Vitest suite
npm run lint                       # ESLint + tsc --noEmit
```

## Agents → Skills mapping
| Agent | Skill | Input | Output |
|-------|-------|-------|--------|
| po-orchestrator | po-requirements | Feature brief | PRD, user stories, task graph |
| design-specialist | ui-composer | PRD + user stories | Design Spec JSON per screen |
| dev-engineer | design-system-kits | Design Spec JSON | React Native .tsx + live preview |

## Folder map
- .claude/agents/         — Agent definitions (po-orchestrator, design-specialist, dev-engineer)
- .claude/skills/         — Skill definitions with references
  - po-requirements/      — Stage 1 skill
  - ui-composer/          — Stage 2 skill (design spec composition)
  - design-system-kits/   — Stage 3 skill (code generation + preview)
  - code-development/     — General TypeScript dev conventions
- src/agents/po/          — Stage 1: PO orchestrator + sub-agents
- src/agents/design/      — Stage 2: design agent + sub-agents
- src/agents/dev/         — Stage 3: dev agent + sub-agents
- src/shared/             — llm.ts, logger.ts, file-io.ts
- src/types/              — AgentResult<T> and all stage types
- docs/design-specs/      — Design Spec JSON output (from Stage 2)
- pipeline-output/        — generated artifacts per run (gitignored)

## Core contract
Every stage returns AgentResult<T> — never raw strings.
Sub-agents are pure async functions: (input: T) => Promise<U>
Never call Anthropic SDK directly — use src/shared/llm.ts

## Architecture
See @docs/architecture.md for full data-flow diagram.
See @docs/agents/ for each stage's deep prompt design.

## Rules
- No console.log — use src/shared/logger.ts
- Named exports only — never default exports
- TypeScript strict — no any types
- Sub-agents within a stage run via Promise.all()
- NEVER commit pipeline-output/ or .env
