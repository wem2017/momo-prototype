# Screen Layout — Design Guideline

## Overview

MoMo KitX uses a hierarchical layout system for structuring screen content. The layout defines how content is organized, spaced, and contained.

---

## Screen Hierarchy

```
Screen (outermost container)
└── Section (responsive container with margins)
    └── Card (elevated content container)
        └── Item (grid-based content block)
```

### Screen
- **Role**: Outermost container for an entire page/screen
- **Features**: Header, scroll behavior, keyboard avoidance, safe area insets
- **Background**: `theme.colors.background.default` (#F2F2F6 light / #121212 dark)

### Section
- **Role**: Responsive container that groups related cards
- **Margin**: 12px horizontal margin on each side (built-in)
- **Options**: `expanded` (full bleed), `backgroundImage` support

### Card
- **Role**: Elevated content container within a section
- **Background**: `theme.colors.background.surface` (white / #1E1E1E)
- **Radius**: `Radius.S` (8)
- **Shadow**: Optional elevation shadow
- **Padding**: Content uses internal `Item` grid

### Item
- **Role**: Grid-based content block within a card
- **Grid**: 12-column system
- **Span options**: `widthSpan` 1–12 (12 = full width, 6 = half, 4 = third, 3 = quarter)

---

## 12-Column Grid System

```
|--12px--|------- 12 columns (full width - 24px margin) -------|--12px--|

|  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  | 10 | 11 | 12 |

widthSpan=12  ──────────────────────────────────────────────────────────
widthSpan=6   ─────────────────────────  ─────────────────────────
widthSpan=4   ────────────────  ────────────────  ────────────────
widthSpan=3   ───────────  ───────────  ───────────  ───────────
```

### Grid Spacing
- **Column gutter**: Built into grid context
- **Section margin**: 12px each side
- **Card internal padding**: `Spacing.L` (16)

---

## Compose Layout System

Compose uses a container-based approach instead of the grid:

### Container Hierarchy
```
ComposeAppContainer / NavigationContainer (app root)
└── Screen content (via navigator.push)
    └── LazyColumn / Column (scrollable content)
        └── Composable components
```

### ComposeAppContainer
- **Role**: App root with theme, navigation, and dependency injection
- **Provides**: Theme, Navigator, Navigation, StatusBar, NavigationBar
- **Background**: `theme.colors.background.default`

### NavigationContainer
- **Role**: Lightweight fallback when ComposeAppContainer unavailable
- **Provides**: Theme, Navigator, Navigation

---

## Screen Structure Specs

### Safe Areas
- **Top**: Status bar height (dynamic, via `AppStatusBar.current`)
- **Bottom**: Navigation bar height (dynamic, via `AppNavigationBar.current`)
- **Horizontal**: 0 (Section provides margin)

### Content Areas
| Area | Description | Spacing |
|------|-------------|---------|
| Header | Title bar with navigation | Height: 44–56 |
| Content | Scrollable body | Padding: Section margin 12 |
| Footer | Fixed bottom actions | Padding: `Spacing.L` horizontal |
| FAB | Floating action button | Position: bottom-right, margin `Spacing.L` |

---

## Usage Guidelines

### When to Use Each Container

| Scenario | Container |
|----------|-----------|
| Full page with header | Screen + Section + Card |
| Content grouping | Section (groups related cards) |
| Distinct content block | Card (with optional shadow) |
| Grid layout | Card + Item with widthSpan |
| Simple list | Section with no Card (flat content) |

### Spacing Between Sections
- Between sections: `Spacing.XL` (24) or built-in section gap
- Between cards within a section: `Spacing.M` (12)
- Card internal content: `Spacing.L` (16) padding

---

## Do's & Don'ts

### Do's
- Use `Screen > Section > Card > Item` hierarchy consistently (RN)
- Use `ComposeAppContainer` as the app root (Compose)
- Keep one container per Fragment/Activity (Compose)
- Use the 12-column grid for responsive layouts

### Don'ts
- Don't nest Screen inside Screen
- Don't nest NavigationContainer inside NavigationContainer
- Don't skip Section and put Card directly in Screen
- Don't hardcode screen margins — use Section's built-in 12px margin
- Don't use arbitrary column counts — stick to 12-column grid
