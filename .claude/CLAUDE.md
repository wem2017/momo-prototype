# AI Feature Pipeline

Automated feature delivery: PO brief → PRD → Design Spec → Code → QA → PR.

## Project purpose
4 AI agent stages replace the manual PO/Design/Dev/QA workflow.
Human PO provides a brief; pipeline outputs a production-ready pull request.

## Tech stack
- Node.js 20 + TypeScript strict
- Anthropic SDK (claude-sonnet-4-20250514)
- Vitest for testing · ESLint + Prettier for linting
- File-based pipeline state in pipeline-output/{runId}/

## Key commands
```bash
npm run pipeline "feature brief"   # full 4-stage run
npm run po "brief"                 # Stage 1 only
npm run design "prd-path"          # Stage 2 only
npm run dev "spec-path"            # Stage 3 only
npm run qa "pr-path"               # Stage 4 only
npm run test                       # Vitest suite
npm run lint                       # ESLint + tsc --noEmit
```

## Folder map
- src/agents/po/        — Stage 1: PO orchestrator + sub-agents
- src/agents/design/    — Stage 2: design agent + sub-agents
- src/agents/dev/       — Stage 3: dev agent + sub-agents
- src/agents/qa/        — Stage 4: QA agent + gates
- src/shared/           — llm.ts, logger.ts, file-io.ts
- src/types/            — AgentResult<T> and all stage types
- pipeline-output/      — generated artifacts per run (gitignored)

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
