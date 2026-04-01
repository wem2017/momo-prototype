---
name: code-development
description: >
  TypeScript React component and agent development for the AI pipeline. Use proactively
  whenever writing, editing, or reviewing any .ts or .tsx file in src/ — including
  new agent functions, sub-agents, API clients, shared utilities, or type definitions.
  Also triggers for "write a component", "implement an agent", "add a sub-agent",
  "refactor", "fix a bug", "create a function", "build the dev stage", or any coding task.
  For UI screen generation from design specs, defer to the design-system-kits skill.
allowed-tools: Read, Write, Bash(npm run lint), Bash(npm run test), Bash(npx tsc --noEmit)
---

# Code Development Skill

## File placement
| What you're building | Where |
|---|---|
| New Stage 1 sub-agent | src/agents/po/{name}.ts |
| New Stage 2 sub-agent | src/agents/design/{name}.ts |
| New Stage 3 sub-agent | src/agents/dev/{name}.ts |
| Shared utility | src/shared/{name}.ts |
| New type/interface | src/types/index.ts |
| Test for any above | same folder, tests/{name}.test.ts |

## UI code generation
For generating React Native screens from Design Spec JSON, use the
`design-system-kits` skill instead. It handles spec-to-code mapping,
component imports, design tokens, and live preview.

## Stage orchestrator template
```typescript
export async function runStageAgent(
  input: StageInput, runId: string
): Promise<AgentResult<StageOutput>> {
  const start = Date.now()
  log('info', runId, 'Stage started')
  try {
    const [a, b] = await Promise.all([subAgentA(input), subAgentB(input)])
    const data: StageOutput = { a, b }
    await writeOutput(runId, 'stage', 'result.json', JSON.stringify(data, null, 2))
    return { status: 'success', data, runId, stage: 'dev', duration: Date.now() - start, logs: [] }
  } catch (e) {
    const error = e instanceof Error ? e.message : String(e)
    return { status: 'error', data: {} as StageOutput, runId, stage: 'dev', duration: Date.now() - start, logs: [], error }
  }
}
```

## Sub-agent template
```typescript
export async function subAgentName(input: T): Promise<U> {
  return llmJSON<U>(`Your prompt:\n\n${JSON.stringify(input)}`, {
    system: 'You are a specialist. Return valid JSON matching U schema.',
  })
}
```

## Checklist before every file write
- [ ] TypeScript strict — no any, no @ts-ignore
- [ ] Named exports only
- [ ] Explicit return types on all async functions
- [ ] AgentResult<T> on all stage orchestrators
- [ ] Promise.all() for parallel sub-agents
- [ ] Error caught, returned as AgentResult with status: 'error'
- [ ] File under 200 lines

## After every write
1. `npx tsc --noEmit` — fix all type errors
2. `npm run lint` — fix errors (warnings OK)
3. `npm run test` — all tests stay green

## References
- references/agent-templates.md — full copy-paste templates
- scripts/check-conventions.sh — auto-check a file for violations
