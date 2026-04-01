# Chip

## React Native

```tsx
import { Chip } from '@momo-kits/chip';

<Chip
  label="Filter"
  selected={isSelected}
  onPress={toggle}
  size="large"                    // 'small'|'large'
  iconLeft="icon_name"            // left icon name
  iconRight={null}               // right icon name (optional)
  iconLeftColor={Colors.pink_03} // left icon tint color
  iconRightColor={Colors.black_12}
  backgroundColor={Colors.black_03}
  accessibilityLabel="filter_chip"
  accessibilityState={{ selected: isSelected }}
/>
```

Note: Chip is a separate package `@momo-kits/chip` in RN.

## Compose

```kotlin
import vn.momo.kits.components.Chip
import vn.momo.kits.components.ChipSize

Chip(
    label = "Filter",
    selected = isSelected,
    onClick = { toggle() },
    size = ChipSize.LARGE,         // SMALL (24dp height), LARGE (32dp height)
    iconLeft = "icon_name",        // left icon name (null = hidden)
    iconRight = null,              // right icon name (null = hidden)
    iconLeftTint = Colors.pink_03, // left icon tint color
    iconRightTint = Colors.black_12,
    backgroundColor = null,        // custom bg when not selected (null = default)
    accessibilityLabel = "filter_chip",
)
```

> **Note:** RN uses `iconLeft`/`iconRight` and `iconLeftColor`/`iconRightColor`. Compose uses `iconLeft`/`iconRight` and `iconLeftTint`/`iconRightTint`.

Chip is built-in (`vn.momo.kits.components`) in Compose.

### ChipSize (Compose)

| Value | Height |
|-------|--------|
| `SMALL` | 24dp |
| `LARGE` | 32dp |
