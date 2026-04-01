# Bottom Tab Bar — Design Guideline

## Overview

Bottom tab navigation provides primary app-level navigation with 3–5 tabs and an optional floating action button (FAB).

---

## Anatomy

```
┌──────────────────────────────────────────────────┐
│                                                  │
│                 Screen Content                   │
│                                                  │
├──────────────────────────────────────────────────┤
│                                                  │
│  [🏠]      [🔍]      [＋]      [💬]      [👤]   │
│  Home     Search    (FAB)    Chat    Profile     │
│                                                  │
│  ────── active indicator ──────                  │
│                                                  │
└──────────────────────────────────────────────────┘
     ↑ safe area bottom
```

---

## Visual Specs

| Property | Value |
|----------|-------|
| Height | 64dp (excluding safe area) |
| Background | `theme.colors.background.surface` |
| Top border | 1px `theme.colors.border.default` |
| Tab count | 3–5 tabs |
| Icon size | 24px |
| Label typography | `caption_s_regular` (10sp) |
| Icon-to-label gap | `Spacing.XXS` (2) |

### Tab States

| State | Icon Color | Label Color |
|-------|-----------|-------------|
| Active | `theme.colors.primary` (pink_03) | `theme.colors.primary` |
| Inactive | `theme.colors.text.hint` (black_12) | `theme.colors.text.hint` |

### Active Indicator
- Animated bar that follows the selected tab
- Color: `theme.colors.primary`
- Height: 2px
- Width: tab width
- Position: top of tab bar
- Animation: horizontal slide (200ms)

---

## Badge & Notification Dot

### BadgeDot
- **Size**: Small (10dp)
- **Position**: Top-right of icon, offset -2/-2
- **Color**: `Colors.red_03`
- **Use for**: Unread indicator, new content flag

### Badge Count
- **Min size**: 18x18
- **Shape**: Pill (full radius)
- **Background**: `Colors.red_03`
- **Text**: White, `caption_s_semibold`
- **Position**: Top-right of icon
- **Content**: Number or "99+" for overflow
- **"0"**: Hidden (badge disappears)

---

## Floating Action Button (FAB)

- **Position**: Centered between tabs, elevated above tab bar
- **Size**: 56x56
- **Shape**: Circle with curved container cutout
- **Background**: `theme.colors.primary` (pink_03)
- **Icon**: White, 24px
- **Label**: `caption_s_regular` below FAB, `theme.colors.primary`
- **Shadow**: Elevation shadow
- **Container**: Curved cutout in tab bar creates visual separation

---

## Tab Transition

- **Animation**: Fade + scale (200ms)
- **Content**: Each tab maintains its own navigation stack
- **State preservation**: Tab content preserved when switching between tabs
- **Scroll position**: Maintained per tab

---

## Usage Guidelines

### Tab Count Rules

| Count | Recommendation |
|-------|---------------|
| 2 | Don't use tabs — consider segmented control or toggle |
| 3 | Ideal — clean layout with clear purpose per tab |
| 4 | Good — balanced with clear labels |
| 5 | Maximum — use concise labels, consider icon-only for some |
| 6+ | Don't — use different navigation pattern |

### Tab Label Rules
- Keep labels to 1 word (max 2 short words)
- Use nouns, not verbs ("Home" not "Go Home")
- Be consistent — all nouns or all verbs, not mixed

---

## Do's & Don'ts

### Do's
- Use bottom tabs for top-level navigation (3–5 destinations)
- Show badges for actionable notifications
- Keep tab labels short and descriptive
- Maintain scroll position when switching tabs

### Don'ts
- Don't use more than 5 tabs
- Don't use bottom tabs for secondary or nested navigation
- Don't hide the tab bar on scroll (keep it always visible)
- Don't use different icon styles across tabs (outline vs filled — be consistent)
- Don't place destructive actions in the tab bar
