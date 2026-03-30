# Full Agent Templates — copy-paste ready

## Complete test file
```typescript
import { describe, it, expect, vi } from 'vitest'
import { subAgentName } from '../sub-agent-name'

vi.mock('../../../shared/llm', () => ({
  llmJSON: vi.fn().mockResolvedValue({ id: 'mock-1', text: 'mock output' }),
}))

function makeInput(overrides = {}) {
  return { brief: 'default brief', ...overrides }
}

describe('subAgentName', () => {
  it('returns correctly shaped output', async () => {
    const result = await subAgentName(makeInput())
    expect(result).toHaveProperty('id')
    expect(result).toHaveProperty('text')
  })

  it('handles LLM errors gracefully via orchestrator', async () => {
    vi.mocked(llmJSON).mockRejectedValueOnce(new Error('timeout'))
    await expect(subAgentName(makeInput())).rejects.toThrow('timeout')
  })
})
```

## Complete stage orchestrator (copy for new stages)
See SKILL.md Stage orchestrator template above.
