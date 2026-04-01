# Badge

## React Native

```tsx
import { Badge, BadgeDot, BadgeDotAnimation, BadgeRibbon } from '@momo-kits/foundation';

<Badge label="99+" backgroundColor={Colors.red_03} />
<BadgeDot size="small" />                // 'small' | 'large'
<BadgeDotAnimation size="small" />       // 'small' | 'large'
<BadgeRibbon label="NEW" />
```

## Compose

```kotlin
import vn.momo.kits.components.Badge
import vn.momo.kits.components.BadgeDot
import vn.momo.kits.components.BadgeRibbon
import vn.momo.kits.components.DotSize

Badge(label = "99+", backgroundColor = Colors.red_03)
BadgeDot(size = DotSize.Small)      // Small(10dp), Large(16dp)
BadgeRibbon(label = "NEW")
```

> **Note:** `BadgeDotAnimation` is RN-only (animated dot). Compose has no equivalent.
