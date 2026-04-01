# Modal — Design Guideline

## Overview

Modals are overlay dialogs that require user attention and action before continuing. They interrupt the user flow for important decisions.

---

## Modal Types

### Dialog Modal (PopupNotify)
- **Coverage**: Centered overlay, ~80% screen width, max 320
- **Background dim**: `Colors.black_20` at 40% opacity
- **Container**: `theme.colors.background.surface`, `Radius.L` (16), `Spacing.XL` (24) padding
- **Animation**: Fade in + scale from 0.9 to 1.0

### Full-screen Modal (Present)
- **Coverage**: Full screen (slides up from bottom)
- **Background**: No dimming (full replacement)
- **Has own header**: Default or custom
- **Animation**: Vertical slide up
- **Dismiss**: Swipe down or back button

---

## Dialog Modal Anatomy

```
┌────── Dimmed Background (40% black) ─────────┐
│                                               │
│    ┌──────────────────────────────┐            │
│    │  [✕]                        │  Radius.L  │
│    │                              │            │
│    │  [Illustration/Image]        │            │
│    │                              │            │
│    │  Title                       │            │
│    │  (headline_s_bold)           │            │
│    │                              │            │
│    │  Description text            │            │
│    │  (body_default_regular)      │            │
│    │                              │            │
│    │  ┌──────────┐ ┌──────────┐  │            │
│    │  │ Secondary│ │ Primary  │  │  row mode  │
│    │  └──────────┘ └──────────┘  │            │
│    │                              │            │
│    └──────────────────────────────┘            │
│                                               │
└───────────────────────────────────────────────┘
```

### Dialog Elements

| Element | Spec | Required |
|---------|------|----------|
| Close icon (✕) | Top-right, 24px, `black_12` | Optional |
| Image/Illustration | Centered, max 120px height | Optional |
| Title | `headline_s_bold`, `text.default` | Yes |
| Description | `body_default_regular`, `text.secondary` | Optional |
| Primary button | Full width or half width | Yes |
| Secondary button | Full width or half width | Optional |

### Button Layout

| Mode | Behavior | Use when |
|------|----------|----------|
| Row | Side-by-side (secondary left, primary right) | Short button labels |
| Column | Stacked (primary top, secondary bottom) | Long button labels |
| Auto | System decides based on text length | Default |

### Button Spacing
- Gap between buttons: `Spacing.S` (8)
- Buttons to container edge: `Spacing.XL` (24)
- Title to description gap: `Spacing.S` (8)
- Description to buttons gap: `Spacing.XL` (24)

---

## Interaction Specs

### Opening
- Animation: 200ms fade in + scale (0.9 → 1.0)
- Background dim: 200ms fade in

### Closing
- Tap close icon (✕)
- Tap dimmed background (if `barrierDismissible = true`)
- System back button/gesture
- Button action
- Animation: 150ms fade out

### Focus Trap
- Focus stays within modal while open
- Tab order: Close → Content → Secondary → Primary
- Escape/Back dismisses

---

## Usage Guidelines

### When to Use Dialog Modal
- Destructive confirmations ("Delete this item?")
- Important alerts requiring acknowledgment
- Decision points with 2 clear options
- Success/error states that need user action

### When to Use Full-screen Modal (Present)
- Creation flows (new post, compose message)
- Complex forms that need full screen
- Media preview/editing
- Multi-step flows within a modal context

### When NOT to Use Modal
- Simple feedback → Use Toast or SnackBar
- Informational notices → Use Information component
- Navigation → Use Push transition
- Content that user may need to reference while acting → Use inline UI

---

## Do's & Don'ts

### Do's
- Keep dialog content concise — title + 1–2 sentences max
- Make primary action clear and descriptive ("Delete", not "OK")
- Use destructive style (`danger` button type) for irreversible actions
- Allow dismissal via background tap for non-critical dialogs

### Don'ts
- Don't stack modals on top of modals
- Don't use modals for long forms — use full-screen modal (Present) instead
- Don't use generic labels ("OK" / "Cancel") — be specific
- Don't auto-dismiss important dialogs — require user action
- Don't put scrollable content in a dialog modal
