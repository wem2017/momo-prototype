# Testing rules — apply when writing or fixing tests

- Framework: Vitest
- Test files: src/agents/{stage}/tests/{name}.test.ts
- Pattern: Arrange → Act → Assert (AAA)
- Coverage minimum: 80% per agent file

## Always mock
```typescript
vi.mock('../../shared/llm', () => ({
  llm: vi.fn().mockResolvedValue('mocked text'),
  llmJSON: vi.fn().mockResolvedValue({ mocked: true }),
}))
vi.mock('../../shared/file-io', () => ({
  writeOutput: vi.fn().mockResolvedValue('/mock/path'),
  readOutput: vi.fn().mockResolvedValue('{}'),
}))
```

## Always test both paths
- Happy path: valid input → expected output
- Error path: LLM throws → AgentResult with status: 'error'

## Factory functions for fixtures
Define at top of test file:
```typescript
function makePOInput(overrides = {}): POInput { return { brief: 'default', ...overrides } }
```
