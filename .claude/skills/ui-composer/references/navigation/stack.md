# Screen Header & Scroll — Design Guideline

## Overview

Screen headers provide navigation context, titles, and actions. The header system supports multiple types with configurable behavior.

---

## Header Types

### Default Header
- **Height**: 44–56
- **Background**: `theme.colors.background.surface`
- **Elements**: Back button (left), title (center), action items (right)
- **Title**: `headline_s_bold`, `theme.colors.text.default`
- **Back button**: Chevron left icon, 24px
- **Bottom border**: 1px `theme.colors.border.default`

### Extended Header
- **Height**: 88–120 (larger area)
- **Features**: Larger title area, optional search input
- **Search**: Animated input that expands on focus
- **Use for**: Home screens, browse screens with search

### Animated Header
- **Behavior**: Collapses on scroll down, expands on scroll up
- **Collapsed height**: 44 (standard)
- **Expanded height**: 88–120
- **Transition**: Smooth fade + height animation
- **Requires**: Connected scroll state (ScrollData + LazyColumn state)

### No Header
- **Use for**: Full-screen content, modals, custom headers
- **Safe area**: Content must handle top safe area manually

---

## Header Anatomy

```
┌──────────────────────────────────────────────┐
│ Status Bar                                    │
├──────────────────────────────────────────────┤
│                                              │
│  [←]     Screen Title          [🔍] [⋯]     │
│                                              │
├──────────────────────────────────────────────┤
│ Border (1px, border.default)                  │
└──────────────────────────────────────────────┘

Left area:     Back button or custom
Center area:   Title text (headline_s_bold)
Right area:    Action icons/buttons (HeaderRight)
```

### Header Right Actions
- **Toolkit**: Standard icon buttons (search, more, etc.)
- **Max items**: 2–3 action icons
- **Icon size**: 24px
- **Spacing between icons**: `Spacing.M` (12)
- **Touch target**: 44x44pt per icon

---

## Scroll Behavior

### Standard Scroll
- Header stays fixed
- Content scrolls underneath
- Use for: Short content, forms

### Collapsing Header (Animated)
- Header collapses from extended to default height on scroll
- Title may animate (scale down, reposition)
- Triggers via connected scroll state

### Scroll-to-Top
- Tap status bar or header title to scroll to top
- Standard iOS/Android behavior

---

## Footer Area

- **Position**: Fixed at bottom of screen, above safe area
- **Background**: `theme.colors.background.surface`
- **Padding**: `Spacing.L` horizontal, `Spacing.M` vertical (container provides)
- **Shadow**: Subtle top shadow for elevation
- **Use for**: Primary action buttons, bottom CTAs

### Floating Action Button (FAB)

- **Position**: Bottom-right corner
- **Margin**: `Spacing.L` from edges
- **Size**: 56x56
- **Shape**: Circle (50% radius)
- **Color**: `theme.colors.primary`
- **Icon**: White, 24px
- **Shadow**: Elevation shadow
- **Animation**: Scale in on mount

---

## Usage Guidelines

| Screen Type | Header Type | Scroll | Footer |
|-------------|------------|--------|--------|
| Detail page | Default | Standard | Action button |
| Home/browse | Extended | Animated collapse | None |
| Form/input | Default | Standard | Submit button |
| Full-screen media | None | None | Overlay controls |
| Modal dialog | Default (no back) | Standard | Action buttons |

---

## Do's & Don'ts

### Do's
- Use `Default` header for most screens
- Connect scroll state to `Animated` header for smooth collapse
- Use footer for primary screen actions (not inline buttons)
- Keep header title concise (max ~20 characters)

### Don'ts
- Don't put more than 3 action icons in header right
- Don't use `Animated` header for short, non-scrollable content
- Don't add padding to footer content — container handles it
- Don't use custom header heights — stick to standard types
