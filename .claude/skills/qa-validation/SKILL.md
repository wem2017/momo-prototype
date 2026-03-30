---
name: qa-validation
description: >
  Run and interpret all quality gates for Stage 4 of the AI pipeline. Use proactively
  whenever running, fixing, or diagnosing any quality check — tests, lint, build, a11y,
  or security. Also triggers for "run the tests", "fix lint errors", "check coverage",
  "QA gate failing", "what's the test coverage", "security scan", "a11y check", "WCAG",
  "write a test for", "Stage 4", or any validation task in src/agents/qa/.
allowed-tools: Read, Write, Bash(npm run lint), Bash(npm run test), Bash(npm run build), Bash(npm audit), Bash(npx tsc --noEmit)
---

# QA Validation Skill

## The 5 gates — all run in parallel, all must pass

### Gate 1 — Lint & type-check
```bash
npm run lint --fix && npm run lint   # auto-fix then verify
npx tsc --noEmit                     # zero type errors required
```

### Gate 2 — Test suite
```bash
npm run test -- --coverage
```
Pass: all tests green · coverage ≥ 80% per agent file

### Gate 3 — Build
```bash
npm run build
```
Zero errors required. Build failure always blocks pipeline.

### Gate 4 — a11y (axe-core programmatic)
Pass: 0 WCAG 2.1 AA violations
Report: component name · WCAG rule · severity · remediation step

### Gate 5 — Security
```bash
npm audit --audit-level high
grep -r "sk-ant\|ANTHROPIC_API_KEY\|Bearer " src/ --include="*.ts"
```
Pass: 0 high/critical deps · 0 hardcoded secrets

## QA report format
```markdown
# QA REPORT — {PASS|FAIL}
**Run ID**: {runId} | **Date**: {date}

## Gate Summary
| Gate | Result | Issues |
|---|---|---|
| Lint & types | PASS | — |
| Test suite | FAIL | Coverage 71% (need 80%) |
| Build | PASS | — |
| a11y | PASS | — |
| Security | PASS | — |

## Action required
- LoginForm.test.ts: add tests for error state (coverage gap)
```

## Common failure diagnosis

**Low coverage** → `npm run test -- --coverage --reporter=text` → find uncovered files → write tests

**Lint error** → read the rule name → check references/lint-rules.md for fix pattern

**Type error** → read the tsc output line → fix the specific type, never use `any` or `@ts-ignore`

**a11y violation** → fix in component source (not in spec) → re-run gate

## References
- references/vitest-patterns.md — test patterns for this project
- references/lint-rules.md — ESLint rules and fix patterns
- scripts/run-all-gates.sh — run all 5 gates in sequence with summary table
