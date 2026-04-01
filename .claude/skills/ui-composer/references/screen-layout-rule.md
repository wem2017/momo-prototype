# Screen Layout Rules

How `Screen` manages spacing, grid, and content layout in React Native and Compose.

---

## useGridLayout (React Native)

`Screen` has a `useGridLayout` prop (default: `true`) that controls whether the screen automatically applies grid-based spacing to its body and children.

| `useGridLayout` | Behavior |
|-----------------|----------|
| `true` (default) | Screen **automatically constrains** spacing — body padding, Section/Card margins, Item gutters are all managed by the grid system. You do **not** add manual padding/margin to Section, Card, or Item. |
| `false` | Screen does **not** apply automatic spacing. Each element (Section, Card, Item, View) must define its own padding, margin, and gap explicitly. Use this when you need full manual control over layout. |

### When to use `useGridLayout={true}` (default)

- Standard screens with Section/Card/Item layout
- Design spec screens — the grid system matches design tokens automatically
- Most screens in the app — this is the recommended default

### When to use `useGridLayout={false}`

- Custom layouts that don't follow the Section/Card/Item pattern
- Full-bleed content (edge-to-edge images, maps, video players)
- Screens where you need pixel-perfect manual control over every spacing value
- Embedding third-party components that manage their own layout

```tsx
// Default: grid layout ON — spacing is automatic
<Screen navigation={navigation} scrollable>
  <Section>
    <Item>{/* auto-spaced by grid */}</Item>
  </Section>
  <Card>
    <Item>{/* auto-spaced by grid */}</Item>
  </Card>
</Screen>

// Grid layout OFF — you control all spacing
<Screen navigation={navigation} scrollable useGridLayout={false}>
  <View style={{ padding: Spacing.L }}>
    {/* manual spacing everywhere */}
  </View>
</Screen>
```

---

## Screen Layout Hierarchy (React Native)

`Section` and `Card` are **siblings** (same level) under `Screen` — never nest one inside the other.

```
Screen
├── Section > Item    (margin container — no background/elevation)
├── Card > Item       (elevated container with background + optional shadow)
```

```tsx
import { Screen, Section, Card, Item } from '@momo-kits/foundation';

<Screen navigation={navigation} scrollable headerType="default">
  <Section>
    <Item widthSpan={12}>{/* full width */}</Item>
    <Item widthSpan={6}>{/* half width */}</Item>
  </Section>
  <Card>
    <Item widthSpan={12}>{/* elevated content */}</Item>
  </Card>
</Screen>
```

- **Screen**: Outermost container (header, scroll, keyboard, safe areas). See `navigation/stack.md` for full props.
- **Section**: Margin container (12px margin, gutter 12px) — contains `Item` directly
- **Card**: Elevated container (background + optional shadow, gutter 8px) — contains `Item` directly
- **Item**: Grid item, `widthSpan` 1-12 (12 = full width)
- **Section and Card are siblings** — both are direct children of Screen, never nested

---

## Section Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `expanded` | `boolean` | `false` | Display in expanded state |
| `useMargin` | `boolean` | `true` | Apply 12px horizontal margin |
| `backgroundImage` | `string` | — | Background image source |

Grid context: `numberOfColumns` (12), `gutterSize` (12px), `sizePerSpan`, `getSizeSpan(span)`.

---

## Card Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `useShadow` | `boolean` | `false` | Show card shadow |
| `backgroundImage` | `string` | — | Background image source |

Grid context: `numberOfColumns` (12), `gutterSize` (8px), `sizePerSpan`, `getSizeSpan(span)`.

---

## Item Props

```tsx
<Item widthSpan={6} heightSpan={2} style={viewStyle} />
```

`widthSpan` and `heightSpan` accept values 1-12.

---

## Automatic Spacing Summary

When `useGridLayout={true}` (default), the Screen applies:

| Container | Horizontal margin | Gutter (gap between Items) | Background |
|-----------|-------------------|---------------------------|------------|
| **Section** | 12px (when `useMargin={true}`) | 12px | None (transparent) |
| **Card** | 12px | 8px | Surface color + optional shadow |
| **Item** | Auto (from grid) | Auto (from grid) | None |

The body itself gets automatic vertical spacing between Section/Card blocks. You do **not** need to add `marginTop`/`marginBottom` between siblings — the grid handles it.
