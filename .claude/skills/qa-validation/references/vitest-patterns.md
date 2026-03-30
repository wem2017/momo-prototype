# Vitest Patterns for This Project

## Always mock LLM and file I/O
```typescript
vi.mock('../../shared/llm', () => ({
  llm: vi.fn().mockResolvedValue('mock text'),
  llmJSON: vi.fn().mockResolvedValue({ mocked: true }),
}))
vi.mock('../../shared/file-io', () => ({
  writeOutput: vi.fn().mockResolvedValue('/mock/path'),
  readOutput: vi.fn().mockResolvedValue('{}'),
}))
```

## Test AgentResult shape
```typescript
it('returns success result', async () => {
  const result = await runPOAgent('Build login page', 'test-run-id')
  expect(result.status).toBe('success')
  expect(result.stage).toBe('po')
  expect(result.runId).toBe('test-run-id')
  expect(result.data.userStories).toBeDefined()
})

it('returns error result when LLM fails', async () => {
  vi.mocked(llmJSON).mockRejectedValueOnce(new Error('timeout'))
  const result = await runPOAgent('Build login page', 'test-run-id')
  expect(result.status).toBe('error')
  expect(result.error).toContain('timeout')
})
```
