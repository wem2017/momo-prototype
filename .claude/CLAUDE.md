# AI Feature Pipeline

Automated feature delivery: Raw brief → Product Brief → PRD → Design Spec JSON → Code + Preview.

## Project purpose
3 AI agent stages replace the manual PO/Design/Dev workflow.
Human PO provides a brief; pipeline outputs production-ready code with live preview.

## Pipeline flow
```
Stage 1: PO Agent          → Product Brief (Phase A) + PRD, user stories, task graph (Phase B)
         (po-orchestrator)    uses: product-craft skill (Phase A + Phase B)
              ↓
Stage 2: Design Agent       → Design Spec JSON per screen
         (design-specialist)  uses: ui-composer skill
              ↓
Stage 3: Dev Agent          → React Native code + live preview
         (dev-engineer)       uses: design-system-kits skill
```

### Stage 1 detail (po-orchestrator two-phase)
```
Raw Feature Brief
  ↓ Phase A — product-craft skill
Product Brief (validated with owner, premise check, scope lock)
  ↓ Phase B — product-craft skill (parallel sub-agents)
PRD + User Stories + Task Graph + Acceptance Criteria
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
npm run po "brief"                 # Stage 1 only (Phase A + B)
npm run design "prd-path"          # Stage 2 only
npm run dev "spec-path"            # Stage 3 only
npm run test                       # Vitest suite
npm run lint                       # ESLint + tsc --noEmit
```

## Agents → Skills mapping
| Agent | Phase | Skill | Input | Output |
|-------|-------|-------|-------|--------|
| po-orchestrator | A | product-craft | Raw feature brief | Product Brief (validated) |
| po-orchestrator | B | product-craft | Product Brief | PRD, user stories, task graph |
| design-specialist | — | ui-composer | PRD + user stories | Design Spec JSON per screen |
| dev-engineer | — | design-system-kits | Design Spec JSON | React Native .tsx + live preview |

## Folder map
- .claude/agents/         — Agent definitions (po-orchestrator, design-specialist, dev-engineer)
- .claude/skills/         — Skill definitions with references
  - product-craft/        — Stage 1 skill (Phase A: product brief + Phase B: PRD, user stories, task graph)
  - ui-composer/          — Stage 2 skill (design spec composition)
  - design-system-kits/   — Stage 3 skill (code generation + preview)
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
