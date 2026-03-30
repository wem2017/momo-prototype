# Code style — apply to every .ts file

- TypeScript strict mode — no `any`, no `@ts-ignore`, no `as unknown`
- Named exports only — never `export default`
- All async functions must have explicit return types
- Max file length: 200 lines — split if longer
- No console.log anywhere — use src/shared/logger.ts
- No hardcoded model names — use process.env.DEFAULT_MODEL
- No hardcoded colors in UI components — use design tokens
- Imports: SDK libs first, then internal by depth (types → shared → agents)

## Naming
- Files: kebab-case (requirements-analyst.ts)
- Classes/types/interfaces: PascalCase
- Functions/variables: camelCase
- Constants: SCREAMING_SNAKE_CASE
