# Typography — Design Guideline

## Type Scale Overview

MoMo KitX uses a structured type scale with the naming pattern: `{category}_{size}_{weight}`.

---

## Full Type Scale

### Headline — Page titles, section headers

| Token | Size | Weight | Line Height | Use for |
|-------|------|--------|-------------|---------|
| `headline_l_bold` | 28sp | Bold | 36 | Page title, hero text |
| `headline_l_semibold` | 28sp | SemiBold | 36 | Page title (lighter) |
| `headline_default_bold` | 24sp | Bold | 32 | Section title |
| `headline_default_semibold` | 24sp | SemiBold | 32 | Section title (lighter) |
| `headline_s_bold` | 20sp | Bold | 28 | Sub-section title |
| `headline_s_semibold` | 20sp | SemiBold | 28 | Sub-section title (lighter) |

### Body — Content text, descriptions

| Token | Size | Weight | Line Height | Use for |
|-------|------|--------|-------------|---------|
| `body_l_semibold` | 16sp | SemiBold | 24 | Emphasized body text |
| `body_l_regular` | 16sp | Regular | 24 | Large body text |
| `body_default_semibold` | 14sp | SemiBold | 20 | Emphasized default text |
| `body_default_medium` | 14sp | Medium | 20 | Medium weight body |
| `body_default_regular` | 14sp | Regular | 20 | Default body text (most common) |
| `body_s_semibold` | 12sp | SemiBold | 16 | Small emphasized text |
| `body_s_regular` | 12sp | Regular | 16 | Small body text |

### Action — Buttons, interactive labels

| Token | Size | Weight | Line Height | Use for |
|-------|------|--------|-------------|---------|
| `action_l_bold` | 18sp | Bold | 24 | Large button label |
| `action_default_bold` | 16sp | Bold | 22 | Default button label |
| `action_s_bold` | 14sp | Bold | 20 | Small button label |

### Caption — Supporting text, metadata

| Token | Size | Weight | Line Height | Use for |
|-------|------|--------|-------------|---------|
| `caption_default_semibold` | 12sp | SemiBold | 16 | Emphasized caption |
| `caption_default_regular` | 12sp | Regular | 16 | Default caption |
| `caption_s_semibold` | 10sp | SemiBold | 14 | Small emphasized caption |
| `caption_s_regular` | 10sp | Regular | 14 | Smallest text |

### Label — Form labels, tags

| Token | Size | Weight | Line Height | Use for |
|-------|------|--------|-------------|---------|
| `label_l_regular` | 16sp | Regular | 22 | Large form label |
| `label_l_bold` | 16sp | Bold | 22 | Emphasized form label |

---

## Typography Hierarchy Rules

### Heading Hierarchy
Use a clear visual hierarchy with no more than 3 heading levels per screen:

```
headline_default_bold     → Page title (1 per screen)
headline_s_bold           → Section title
body_l_semibold           → Sub-section title
body_default_regular      → Body content
caption_default_regular   → Supporting info
```

### Font Families

| Family | Use for |
|--------|---------|
| `SFProText` | Default system font (all UI text) |
| `AlegreyaSans` | Decorative, special promotions |
| `BarlowCondensed` | Condensed layouts, data-heavy screens |

### Font Scaling
- Font sizes automatically scale based on user accessibility settings
- Design at 1x scale, system handles scaling
- Ensure layouts accommodate up to 1.5x text scaling without breaking

---

## Pairing Rules

### Recommended Pairings

| Context | Title | Body | Caption |
|---------|-------|------|---------|
| Card content | `body_default_semibold` | `body_default_regular` | `caption_default_regular` |
| List item | `body_default_semibold` | `body_s_regular` | `caption_s_regular` |
| Page header | `headline_default_bold` | `body_default_regular` | — |
| Form field | `label_l_regular` | `body_default_regular` | `caption_default_regular` |
| Banner/alert | `body_default_semibold` | `body_s_regular` | — |

### Color Pairings with Typography

| Text Role | Typography | Color Token |
|-----------|-----------|-------------|
| Primary content | `body_default_regular` | `theme.colors.text.default` |
| Secondary info | `body_s_regular` | `theme.colors.text.secondary` |
| Hint/placeholder | `body_default_regular` | `theme.colors.text.hint` |
| Disabled | any | `theme.colors.text.disable` |
| Error message | `caption_default_regular` | `theme.colors.error.primary` |
| Link text | `body_default_semibold` | `theme.colors.interactive.primary` |

---

## Accessibility

- **Minimum text size**: `caption_s_regular` (10sp) — use sparingly, only for non-critical metadata
- **Body text minimum**: 14sp (`body_default_regular`) for primary reading content
- **Line height**: Always use the defined line height — do not compress
- **Contrast**: All text must meet WCAG AA (4.5:1 normal, 3:1 large/bold)

---

## Do's & Don'ts

### Do's
- Use `body_default_regular` as the standard body text throughout the app
- Maintain consistent heading hierarchy within each screen
- Use `action_*_bold` tokens for all button labels (maps to button sizes)
- Use SemiBold for emphasis within body text, not color changes

### Don'ts
- Don't use more than 3 heading levels per screen
- Don't use `caption_s_*` (10sp) for important information — it's too small
- Don't mix font families on the same screen (except intentional brand moments)
- Don't manually set font sizes — always use typography tokens
- Don't use Bold weight for body text — reserve Bold for action and headline
