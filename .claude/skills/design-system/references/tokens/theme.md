# Theme — Design Guideline

## Overview

MoMo KitX supports light and dark themes through semantic color tokens. Designers should use `theme.colors.*` paths instead of direct `Colors.*` tokens so the UI adapts automatically.

---

## Semantic Color Structure

```
theme.colors
├── primary              → Brand accent
├── secondary            → Brand tint
├── background
│   ├── default          → Page background
│   ├── surface          → Card/container surface
│   ├── tonal            → Brand-tinted background
│   ├── pressed          → Pressed state overlay
│   ├── selected         → Selected state background
│   └── disable          → Disabled element background
├── text
│   ├── default          → Primary text
│   ├── secondary        → Supporting text
│   ├── hint             → Placeholder/caption text
│   └── disable          → Disabled text
├── border
│   ├── default          → Standard borders
│   └── disable          → Disabled borders
├── success
│   ├── primary          → Success text/icon
│   ├── secondary        → Success accent
│   └── container        → Success background
├── warning              → (same structure as success)
├── error                → (same structure as success)
├── highlight            → (same structure as success)
└── interactive          → (same structure as success)
```

---

## Light Theme Specs

| Path | Token | Hex | Design Use |
|------|-------|-----|------------|
| `primary` | `pink_03` | #EB2F96 | Primary buttons, active indicators |
| `secondary` | `pink_07` | — | Secondary brand accent |
| `background.default` | — | #F2F2F6 | Page/screen background |
| `background.surface` | `black_01` | #FFFFFF | Cards, containers, modals |
| `background.tonal` | `pink_09` | — | Brand-tinted sections |
| `background.pressed` | — | #DFDFE6 | Touch feedback overlay |
| `background.selected` | `pink_10` | — | Selected item background |
| `background.disable` | — | #EBEBF2 | Disabled containers |
| `text.default` | `black_17` | #303233 | Body text, headings |
| `text.secondary` | `black_15` | #484848 | Subtitles, supporting text |
| `text.hint` | `black_12` | #727272 | Placeholders, captions |
| `text.disable` | `black_08` | #C6C6C6 | Disabled labels |
| `border.default` | `black_04` | #E8E8E8 | Input borders, dividers |
| `border.disable` | `black_03` | #F0F0F0 | Disabled borders |
| `success.primary` | `green_03` | #34C759 | Success icon/text |
| `success.container` | `green_08` | — | Success banner background |
| `warning.primary` | `orange_03` | #FA541C | Warning icon/text |
| `warning.container` | `orange_08` | — | Warning banner background |
| `error.primary` | `red_03` | #F5222D | Error icon/text |
| `error.container` | `red_08` | — | Error banner background |
| `highlight.primary` | `mint_03` | — | Highlight icon/text |
| `interactive.primary` | `blue_03` | #007AFF | Links, interactive elements |

---

## Dark Theme Specs

| Path | Token | Hex | Design Use |
|------|-------|-----|------------|
| `primary` | `pink_04` | — | Primary buttons (slightly lighter for dark bg) |
| `secondary` | `pink_08` | — | Secondary accent |
| `background.default` | — | #121212 | Page background |
| `background.surface` | — | #1E1E1E | Cards, containers |
| `background.pressed` | — | #1A1A1A | Touch feedback |
| `background.selected` | `pink_11` | — | Selected item |
| `background.disable` | — | #303030 | Disabled containers |
| `text.default` | — | #FFFFFF | Primary text |
| `text.secondary` | — | #B0B0B0 | Supporting text |
| `text.hint` | — | #727272 | Placeholder text |
| `text.disable` | — | #505050 | Disabled text |
| `border.default` | — | #2A2A2A | Borders |
| `border.disable` | — | #242424 | Disabled borders |

Success, warning, error, highlight, interactive tokens remain the same in both themes.

---

## Usage Guidelines

### When to Use Semantic Tokens vs Direct Colors

| Scenario | Use | Example |
|----------|-----|---------|
| Text that should adapt to theme | `theme.colors.text.default` | Body text |
| Brand-colored CTA | `theme.colors.primary` | Primary button |
| Error state | `theme.colors.error.primary` | Error message |
| Fixed-color element (e.g. logo) | Direct `Colors.*` | `Colors.pink_MoMo_Branding` |

### Dark Mode Design Rules

1. **Elevation = lighter** — In dark mode, higher elevation surfaces are lighter (not darker)
2. **Surface hierarchy**: `background.default` (#121212) < `background.surface` (#1E1E1E) < elevated surfaces
3. **No pure black text on dark surfaces** — Use `text.default` (white) instead
4. **Maintain contrast** — Test all text/background combinations in both themes

---

## Do's & Don'ts

### Do's
- Use `theme.colors.*` for all colors that should adapt between light/dark
- Test designs in both light and dark themes
- Use `background.surface` for cards/containers (not hardcoded white)
- Use semantic status colors (`error`, `success`, `warning`) for feedback states

### Don'ts
- Don't hardcode `#FFFFFF` for surfaces — use `background.surface`
- Don't assume dark mode is just "inverted" — it has its own specific values
- Don't use `background.pressed` as a permanent background — it's for touch feedback only
- Don't use direct `Colors.pink_03` when `theme.colors.primary` would be more appropriate
