---
name: po-requirements
description: >
  Transform raw feature briefs into structured PRDs, user stories, and task graphs for
  Stage 1 of the AI pipeline. Use proactively whenever: working on src/agents/po/,
  writing or improving prompt templates for requirements-analyst, user-story-writer,
  scope-guard, or task-decomposer. Also triggers for "write a PRD", "create user stories",
  "define acceptance criteria", "break down a feature", "is this in scope",
  "what are the requirements", or any product planning task.
allowed-tools: Read, Write
---

# PO Requirements Skill

## Stage 1 outputs (all written to pipeline-output/{runId}/po/)

| File | Format | Read by |
|---|---|---|
| prd.md | Markdown | Human PO review |
| user-stories.yaml | YAML | Design Agent (Stage 2) |
| task-graph.json | JSON | Dev Agent (Stage 3) |
| acceptance-criteria.md | Markdown | QA Agent (Stage 4) |

## User story schema — Design Agent reads this exactly
```yaml
- id: us-001
  title: User can log in with email and password
  given: I am on the login page
  when: I enter valid credentials and click Submit
  then: I am redirected to the dashboard
  complexity: M        # S / M / L
  screens: [login-page]
  apiEndpoints: [POST /auth/login]
```

## Task graph schema — Dev Agent reads this exactly
```json
{ "tasks": [
  { "id": "task-001", "storyId": "us-001",
    "title": "Build LoginForm component",
    "type": "component", "dependsOn": [], "complexity": "M" }
]}
```
Tasks with empty dependsOn[] run in parallel. Add deps only when output is genuinely needed.

## Complexity sizing
- S = < 2 hours (add a field, change a label)
- M = 2–8 hours (new page with API)
- L = > 8 hours → must be split further before entering task-graph.json

## Rules
1. Brief < 50 words → ask PO for clarification before generating
2. Scope guard: anything NOT in the brief goes in outOfScope[]
3. Each user story must be independently testable

## References
- references/prd-template.md — full PRD markdown template
- references/story-examples.yaml — 10 example stories across complexities
- scripts/validate-stories.sh — validate user-stories.yaml schema
