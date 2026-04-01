# Tag

## React Native

```tsx
import { Tag } from '@momo-kits/foundation';

<Tag
  label="Active"
  size="large"                         // 'medium'|'large' (default: 'large')
  color="green"                         // 'default'|'orange'|'green'|'red'|'blue'|'grey'
  icon="icon_name"                      // optional left icon
  customColor={Colors.pink_03}         // overrides color (use _03 tint recommended)
  accessibilityLabel="tag_active"
  style={{ marginRight: Spacing.S }}   // optional custom style
/>
```

## Compose

```kotlin
import vn.momo.kits.components.Tag
import vn.momo.kits.components.TagSize
import vn.momo.kits.components.TagColor

Tag(
    label = "Active",
    size = TagSize.Medium,         // Large(24f), Medium(18f)
    color = TagColor.Green,        // Default, Orange, Green, Red, Blue, Grey
    customColor = Colors.pink_03, // overrides color when provided
)
```

### TagSize (Compose)

| Value | Height |
|-------|--------|
| `Large` | 24f |
| `Medium` | 18f |

### TagColor (Compose)

| Value | Background | Text |
|-------|-----------|------|
| `Default` | black_04 | black_17 |
| `Orange` | orange_08 | orange_03 |
| `Green` | green_08 | green_03 |
| `Red` | red_08 | red_03 |
| `Blue` | blue_08 | blue_03 |
| `Grey` | black_04 | black_12 |
