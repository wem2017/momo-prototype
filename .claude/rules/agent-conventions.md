# Agent conventions — always apply when working in src/agents/

## Return type
Every stage orchestrator MUST return AgentResult<T>:
```typescript
{ status: 'success' | 'error', data: T, runId: string,
  stage: 'po'|'design'|'dev', duration: number, logs: string[], error?: string }
```

## Sub-agent pattern
Pure async function, no AgentResult wrapper:
```typescript
async function subAgentName(input: T): Promise<U>
```

## Parallel execution
Sub-agents within a stage always run in parallel:
```typescript
const [a, b, c] = await Promise.all([subA(input), subB(input), subC(input)])
```

## LLM calls
Never import from @anthropic-ai/sdk directly.
Always use: import { llm, llmJSON } from '../../shared/llm'

## Logging
Never console.log. Always:
import { log } from '../../shared/logger'
log('info', runId, 'message', optionalData)

## Error handling
Catch all errors, return AgentResult with status: 'error'.
Never let exceptions bubble out of a stage orchestrator.

## File output
Write all stage artifacts to pipeline-output/{runId}/{stage}/
Use writeOutput() from src/shared/file-io.ts
