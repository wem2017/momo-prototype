---
name: design-spec
description: >
  Convert PRD and user stories into component specs, design tokens, and wireframes for
  Stage 2 of the AI pipeline. Use proactively whenever working on src/agents/design/,
  writing component specifications, mapping design tokens, creating wireframes, or checking
  accessibility at design time. Also triggers for "component spec", "design tokens",
  "wireframe", "design system", "a11y pre-check", "WCAG", "what components do I need",
  "map to tokens", or any Stage 2 design task.
allowed-tools: Read, Write
---

# Design Spec Skill

## Stage 2 outputs (written to pipeline-output/{runId}/design/)

| File | Read by |
|---|---|
| component-spec.json | Dev Agent — component builder |
| design-tokens.json | Dev Agent — all sub-agents |
| wireframes/{screen}.md | Dev Agent — component builder, PR author |
| a11y-flags.md | Dev Agent — component builder; QA — a11y validator |

## Component spec schema — Dev Agent reads this exactly
```json
{
  "name": "LoginForm",
  "description": "Email + password with submit and error states",
  "props": { "onSuccess": "(token: string) => void", "isLoading": "boolean" },
  "states": ["idle", "loading", "error", "success"],
  "variants": ["default", "compact"],
  "tokens": ["color-primary", "spacing-md", "border-radius-sm"],
  "a11yNotes": ["Form must have aria-label", "Error linked via aria-describedby"],
  "storybook": { "stories": ["Default", "Loading", "WithError"] }
}
```

## Token mapping rules
1. NEVER introduce new tokens — map to existing ones only
2. Flag gaps in a11y-flags.md as design gap (not an error)
3. Token categories: color-*, spacing-*, border-radius-*, font-size-*, shadow-*

## Wireframe format (text-based, one file per screen)
```markdown
# Screen: Login Page
## Layout
[HEADER — full width] Logo | Nav
[MAIN — centered max-width 400px]
  H1: "Sign in to your account"
  [LoginForm component]
    Label: Email / Input: email / Label: Password / Input: password
    [Error zone — hidden by default]
    Button: "Sign in" — full width primary
    Link: "Forgot password?" — centered
[FOOTER] Copyright
## Breakpoints
- Mobile < 640px: full-width form, 16px padding
- Desktop ≥ 640px: centered card, max-width 400px
```

## a11y pre-check rules
- Contrast ratio < 4.5:1 for normal text → ERROR (blocks pipeline)
- Interactive element without label/aria-label → ERROR
- Focus order breaks visual order → WARNING
- Color as only indicator → ERROR (WCAG 1.4.1)

## Design system lookup (do this FIRST before speccing new components)
1. Read docs/design-system-inventory.md if present
2. Match → reuse existing component, note name in spec
3. Similar → extend with new variant
4. Truly new → spec in full component-spec.json format

## References
- references/token-system.md — complete token catalog
- references/a11y-checklist.md — full WCAG 2.1 AA checklist
