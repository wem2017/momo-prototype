# Spacing & Radius — Design Guideline

## Spacing Scale

MoMo KitX uses a consistent spacing scale for padding, margins, and gaps.

| Token | Value | Design Use |
|-------|-------|------------|
| `Spacing.XXS` | 2 | Micro gap (icon-to-text inline) |
| `Spacing.XS` | 4 | Tight gap (badge offset, dense lists) |
| `Spacing.S` | 8 | Small gap (between related elements, icon padding) |
| `Spacing.M` | 12 | Default gap (content padding, list item spacing) |
| `Spacing.L` | 16 | Standard padding (card padding, section margins) |
| `Spacing.XL` | 24 | Large gap (section separation, modal padding) |
| `Spacing.XXL` | 32 | Extra large (page top/bottom padding, major sections) |
| `Spacing.3XL` | 48 | RN only — hero spacing |
| `Spacing.4XL` | 56 | RN only — large hero spacing |
| `Spacing.5XL` | 64 | RN only — extra large spacing |

---

## Spacing Usage Rules

### Component Internal Spacing

| Component | Padding | Gap |
|-----------|---------|-----|
| Button (large) | `Spacing.L` horizontal, `Spacing.M` vertical | `Spacing.S` icon-to-text |
| Button (medium) | `Spacing.M` horizontal, `Spacing.S` vertical | `Spacing.S` icon-to-text |
| Button (small) | `Spacing.S` horizontal, `Spacing.XS` vertical | `Spacing.XS` icon-to-text |
| Card | `Spacing.L` all sides | — |
| Input | `Spacing.M` horizontal, `Spacing.S` vertical | — |
| List item | `Spacing.L` horizontal, `Spacing.M` vertical | `Spacing.M` between items |
| Badge | `Spacing.XS` horizontal | — |
| Tag | `Spacing.S` horizontal, `Spacing.XXS` vertical | — |

### Layout Spacing

| Context | Token | Value |
|---------|-------|-------|
| Screen horizontal margin | `Spacing.L` | 16 |
| Section margin (Section component) | 12 | 12 (built-in) |
| Between cards in a section | `Spacing.M` | 12 |
| Between sections | `Spacing.XL` | 24 |
| Modal/sheet content padding | `Spacing.XL` | 24 |
| Form field vertical gap | `Spacing.L` | 16 |
| Inline element gap | `Spacing.S` | 8 |

### Layout Grid

React Native uses a **12-column grid** via `Screen > Section > Card > Item`:

```
Screen (full width)
└── Section (12px margin each side)
    └── Card (container with optional shadow)
        ├── Item widthSpan=12  → full width
        ├── Item widthSpan=6   → half width
        ├── Item widthSpan=4   → one-third width
        └── Item widthSpan=3   → one-quarter width
```

---

## Radius Scale

| Token | Value | Design Use |
|-------|-------|------------|
| `Radius.XXS` | 2 | Subtle rounding (tags, small elements) |
| `Radius.XS` | 4 | Small elements (badges, small buttons) |
| `Radius.S` | 8 | Cards, inputs, containers |
| `Radius.M` | 12 | Medium containers, dropdowns |
| `Radius.L` | 16 | Modals, bottom sheets, large cards |
| `Radius.XL` | 24 | Pills, chips, rounded buttons |

### Radius Usage Rules

| Element | Radius Token |
|---------|-------------|
| Card | `Radius.S` (8) |
| Input field | `Radius.S` (8) |
| Button (large) | `Radius.XL` (24) — pill shape |
| Button (small) | `Radius.M` (12) |
| Modal | `Radius.L` (16) top corners |
| Bottom sheet | `Radius.L` (16) top corners |
| Chip / Tag | `Radius.XL` (24) — full pill |
| Avatar | Full circle (50% radius) |
| Tooltip | `Radius.S` (8) |
| Badge | Full circle or `Radius.XS` (4) |

---

## Spacing Annotation Examples

### Card with content
```
┌───────────────────────────────────────────┐
│ Spacing.L (16)                            │
│  ┌─────────────────────────────────────┐  │
│  │ Title (headline_s_bold)             │  │
│  │                                     │  │
│  │ Spacing.S (8) gap                   │  │
│  │                                     │  │
│  │ Description (body_default_regular)  │  │
│  └─────────────────────────────────────┘  │
│ Spacing.L (16)                            │
└───────────────────────────────────────────┘
  Radius.S (8) corners
```

### Form layout
```
┌─ Screen margin: Spacing.L (16) ───────────┐
│                                            │
│  Label (label_l_regular)                   │
│  Spacing.XS (4) gap                       │
│  ┌──────────────────────────────────────┐  │
│  │ Input                    Radius.S(8) │  │
│  └──────────────────────────────────────┘  │
│  Spacing.L (16) gap                       │
│  Label                                     │
│  Spacing.XS (4) gap                       │
│  ┌──────────────────────────────────────┐  │
│  │ Input                               │  │
│  └──────────────────────────────────────┘  │
│                                            │
└────────────────────────────────────────────┘
```

---

## Do's & Don'ts

### Do's
- Use `Spacing.L` (16) as the standard horizontal padding for screen content
- Use `Spacing.M` (12) as the default vertical gap between related elements
- Use `Spacing.XL` (24) to separate distinct sections
- Match radius to component size — larger components get larger radius

### Don'ts
- Don't use arbitrary spacing values — always pick from the scale
- Don't mix different radius values on elements at the same level
- Don't use `Spacing.XXS` (2) for content gaps — it's only for micro-adjustments
- Don't apply corner radius to only some corners of a card (except modals/sheets: top only)
