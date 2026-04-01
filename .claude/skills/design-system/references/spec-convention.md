---
tags: design, convention, spec, guideline, designer
related: design-system-kits/references/code-convention.md
---

# Spec Convention

Apply this convention to every AI-generated design specification.

## Scope and Consistency

1. Use this document as the single source of truth for design spec formatting.
2. Any copied spec-convention reference in other skills must be identical to this file.
3. Every design spec maps 1:1 to a code reference in design-system-kits.

## 0) Spec Structure

Every component design spec MUST follow this structure in order:

1. **Title** — Component name as H1
2. **Description** — What the component does, package name, platform support
3. **Anatomy** — ASCII diagram showing structural parts + parts table
4. **Variants** — Visual style variations (if applicable)
5. **Sizes** — Dimension options with token references
6. **States** — All interactive states with color tokens
7. **Spacing and Dimensions** — Layout tokens used
8. **Layout** — Positioning and alignment rules
9. **Accessibility** — WCAG, touch targets, screen reader notes
10. **Do's and Don'ts** — Usage guidance

## 1) Token References

1. Always reference design tokens — never raw hex or px values.
2. Color format: `Colors.{name}` (e.g., `Colors.pink_03`)
3. Spacing format: `Spacing.{size}` with pixel value (e.g., `Spacing.M` (12))
4. Radius format: `Radius.{size}` with pixel value (e.g., `Radius.S` (8))
5. Typography format: `{category}_{size}_{weight}` (e.g., `action_default_bold`)
6. Theme color format: `theme.colors.{path}` (e.g., `theme.colors.primary`)

## 2) Platform Parity

1. Indicate platform support: `RN ✅ | Compose ✅` or `RN ✅ | Compose ❌`
2. Note behavioral differences between platforms when they exist.
3. Use the same token names across platforms.

## 3) State Coverage

Every interactive component MUST define these states:

1. **Default** — Resting state
2. **Pressed** — Active touch state
3. **Focused** — Input focus state (for form controls)
4. **Disabled** — Non-interactive state
5. **Error** — Validation failure (for form controls)
6. **Loading** — Async operation in progress (where applicable)

## 4) Accessibility Requirements

1. Minimum touch target: 44pt
2. Color contrast: WCAG AA (4.5:1 minimum for text)
3. Screen reader labels for all interactive elements
4. Focus management for form flows

## 5) Bilingual Labels

1. Use English for all spec content
2. Add Vietnamese (tiếng Việt) labels where relevant for MoMo team context
3. Format: `English label` / `Vietnamese label`

## 6) Enforcement Checklist

Before finalizing a design spec, verify:

1. All color values use token references, not raw hex.
2. All spacing/dimension values use token references, not raw pixels.
3. All interactive states are documented.
4. Accessibility section is included.
5. Platform support is indicated.
6. Anatomy diagram is present.
7. Do's and Don'ts section is included.
