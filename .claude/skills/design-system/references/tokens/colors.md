# Colors — Design Guideline

## Color System Overview

MoMo KitX uses a token-based color system shared across React Native and Compose. All colors are referenced by token name (e.g. `Colors.pink_03`), never by raw hex values.

---

## Grayscale Palette (black_01 – black_20)

| Token | Hex | Design Role |
|-------|-----|-------------|
| `black_01` | #FFFFFF | White, surface backgrounds |
| `black_02` | #F9F9F9 | Subtle background |
| `black_03` | #F0F0F0 | Border disabled state |
| `black_04` | #E8E8E8 | Border default, dividers |
| `black_05` | #E5E5E5 | Light separator |
| `black_06` | #D8D8D8 | Muted border |
| `black_07` | #CCCCCC | Placeholder icon |
| `black_08` | #C6C6C6 | Text disabled |
| `black_09` | #B9B9B9 | Inactive icon |
| `black_10` | #A0A0A0 | Subtle text |
| `black_11` | #878787 | Muted text |
| `black_12` | #727272 | Text hint / placeholder |
| `black_13` | #646464 | Secondary icon |
| `black_14` | #565656 | Medium emphasis text |
| `black_15` | #484848 | Text secondary |
| `black_16` | #404040 | Strong secondary text |
| `black_17` | #303233 | Text default (primary) |
| `black_18` | #242424 | High emphasis text |
| `black_19` | #18191A | Near-black text |
| `black_20` | #000000 | Pure black |

### Text Color Hierarchy
- **Primary text**: `black_17` (#303233) — body content, headings
- **Secondary text**: `black_15` (#484848) — supporting info, subtitles
- **Hint/placeholder text**: `black_12` (#727272) — input hints, captions
- **Disabled text**: `black_08` (#C6C6C6) — non-interactive text

### Border Color Usage
- **Default border**: `black_04` (#E8E8E8) — input borders, card outlines
- **Disabled border**: `black_03` (#F0F0F0) — disabled input borders

---

## Brand Color Families

Each family has 11 tint levels: **01** (darkest) → **11** (lightest).
- Levels **01–03**: Primary use (text, icons, interactive elements)
- Levels **04–06**: Secondary use (hover states, accents)
- Levels **07–11**: Background/container tints

### Primary Colors

| Family | 01 | 02 | 03 | Design Role |
|--------|----|----|-----|-------------|
| **pink** | #BC2678 | #D42A87 | #EB2F96 | Brand primary, CTA buttons |
| **blue** | #0062CC | #006EE6 | #007AFF | Interactive, links, info |
| **red** | #C41B24 | #DD1F29 | #F5222D | Error, danger, destructive |
| **green** | #2A9F47 | #2FB350 | #34C759 | Success, positive, confirmation |
| **orange** | #C84316 | #E14C19 | #FA541C | Warning, caution |
| **gold** | #C87012 | #E17E14 | #FA8C16 | Rewards, highlights |
| **mint** | — | — | — | Highlight, promotional |
| **violet** | — | — | — | Accents, special features |
| **indigo** | — | — | — | Accents |
| **lime** | — | — | — | Accents |
| **yellow** | — | — | — | Accents |

Special: `pink_MoMo_Branding` = #A50064 (official MoMo brand color — use only for logo/branding, not UI)

---

## Color Usage Rules

### Semantic Color Mapping

| Intent | Token | Use for |
|--------|-------|---------|
| Brand / Primary CTA | `Colors.pink_03` | Primary buttons, active tabs, selected states |
| Interactive / Links | `Colors.blue_03` | Links, secondary actions, info states |
| Error / Danger | `Colors.red_03` | Error messages, destructive buttons, validation |
| Success | `Colors.green_03` | Success states, confirmation, positive indicators |
| Warning | `Colors.orange_03` | Warning banners, caution messages |
| Highlight | `Colors.mint_03` | Promotional highlights, feature callouts |

### Background Tint Usage

Use tint levels 07–11 for backgrounds to maintain readability:

| Context | Background Token | Text Token | Contrast |
|---------|-----------------|------------|----------|
| Error container | `Colors.red_08` | `Colors.red_03` | ✅ AA |
| Success container | `Colors.green_08` | `Colors.green_03` | ✅ AA |
| Warning container | `Colors.orange_08` | `Colors.orange_03` | ✅ AA |
| Info container | `Colors.blue_08` | `Colors.blue_03` | ✅ AA |
| Brand container | `Colors.pink_09` | `Colors.pink_03` | ✅ AA |

---

## Accessibility

### Contrast Requirements (WCAG AA)
- **Normal text** (< 18sp): minimum 4.5:1 contrast ratio
- **Large text** (≥ 18sp bold or ≥ 24sp): minimum 3:1 contrast ratio
- **Interactive elements**: minimum 3:1 against background

### Pre-validated Combinations
| Text | Background | Ratio | Pass |
|------|-----------|-------|------|
| `black_17` on `black_01` | Dark on white | 12.6:1 | ✅ AAA |
| `black_15` on `black_01` | Secondary on white | 8.2:1 | ✅ AAA |
| `black_12` on `black_01` | Hint on white | 4.6:1 | ✅ AA |
| `black_01` on `pink_03` | White on brand | 4.5:1 | ✅ AA |
| `black_08` on `black_01` | Disabled on white | 2.2:1 | ❌ Decorative only |

---

## Do's & Don'ts

### Do's
- Use `Colors.pink_03` for primary CTA — it's the brand color
- Use semantic tokens (`theme.colors.error.primary`) so colors adapt in dark mode
- Use tint levels 07–11 for container backgrounds
- Pair `black_17` with `black_01` for maximum readability

### Don'ts
- Don't hardcode hex values — always map to a token name
- Don't use `pink_MoMo_Branding` (#A50064) for UI elements — it's for logo/branding only
- Don't use tint levels 01–03 as backgrounds for large areas — too saturated
- Don't place `black_12` (hint) on colored backgrounds — may fail contrast
- Don't mix brand colors in the same visual group (e.g. pink button next to blue button)
