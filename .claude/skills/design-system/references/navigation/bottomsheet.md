# Bottom Sheet — Design Guideline

## Overview

Bottom sheets slide up from the bottom of the screen to reveal additional content or actions. They maintain context by keeping the parent screen partially visible.

---

## Anatomy

```
┌──────────────────────────────────────────────┐
│                                              │
│           Parent Screen (dimmed)             │
│                                              │
├──────────────────────────────────────────────┤
│            ─── Handle ───                    │  Radius.L
│                                              │  (top corners)
│                                              │
│     Sheet Content                            │
│     (scrollable if needed)                   │
│                                              │
│                                              │
│                                              │
└──────────────────────────────────────────────┘
       ↑ safe area bottom
```

---

## Visual Specs

| Property | Value |
|----------|-------|
| Background | `theme.colors.background.surface` |
| Corner radius | `Radius.L` (16) — top-left and top-right only |
| Handle | 36x4, `Colors.black_06`, centered, `Spacing.S` from top |
| Backdrop | `Colors.black_20` at 40% opacity |
| Content padding | `Spacing.XL` (24) horizontal, `Spacing.L` (16) vertical |
| Max height | 90% of screen height |
| Min height | Content-driven (auto-size) |

---

## Sheet Variants

### Standard Sheet
- **Content**: Custom composable content
- **Height**: Auto-sized to content (up to 90% screen)
- **Scroll**: Scrollable if content exceeds height
- **Use for**: Action lists, selections, additional info

### Surface Sheet
- **Surface mode** (`isSurface = true`): White surface background without handle
- **Use for**: Integrated content that feels like part of the screen

---

## Interaction Specs

### Opening
- Animation: Slide up from bottom (300ms, ease-out)
- Backdrop: Fade in simultaneously

### Closing
- Swipe down on handle or content
- Tap backdrop (if `barrierDismissible = true`)
- System back button/gesture
- Programmatic dismiss
- Animation: Slide down (250ms, ease-in)

### Gestures
- **Drag handle**: Swipe down to dismiss
- **Content scroll**: If content is scrollable, scroll reaches top then swipe dismisses
- **Velocity threshold**: Fast swipe down auto-dismisses

---

## Content Patterns

### Action List
```
─── Handle ───

  Action Item 1            [icon]
  ─────────────────────────────
  Action Item 2            [icon]
  ─────────────────────────────
  Action Item 3            [icon]

  [ Cancel button (full width, text type) ]
```

- Item height: 48
- Item padding: `Spacing.L` horizontal
- Typography: `body_default_regular`
- Divider: 1px `border.default` between items
- Cancel button: `Spacing.L` top margin

### Selection List
```
─── Handle ───

  Title (headline_s_bold)

  ○  Option A
  ●  Option B (selected)
  ○  Option C

  [ Confirm button (full width, primary) ]
```

- Radio/Checkbox with label
- Spacing between options: `Spacing.M`
- Confirm button: `Spacing.XL` top margin

### Information Sheet
```
─── Handle ───

  Title (headline_s_bold)

  Description text (body_default_regular)
  Multi-line content with details...

  [ Got it (full width, primary) ]
```

---

## Usage Guidelines

### When to Use Bottom Sheet
- Secondary actions for a list item
- Filter/sort options
- Selection from a list of options (< 10 items)
- Additional details without leaving context
- Share/export options

### When NOT to Use
- Critical confirmations → Use Dialog Modal (PopupNotify)
- Complex forms → Use full-screen modal (Present) or new screen
- Primary navigation → Use Push or tabs
- Many options (10+) → Use a full screen with search

---

## Do's & Don'ts

### Do's
- Keep bottom sheet content concise and scannable
- Show handle for swipe-to-dismiss affordance
- Allow backdrop tap to dismiss for non-critical sheets
- Use standard content patterns (action list, selection, info)

### Don'ts
- Don't nest bottom sheets inside bottom sheets
- Don't use bottom sheets for lengthy forms
- Don't disable swipe-to-dismiss unless data loss is possible
- Don't make bottom sheets taller than 90% of screen
- Don't use bottom sheets for content that needs to persist
