# Skeleton

## React Native

```tsx
import { Skeleton } from '@momo-kits/foundation';

<Skeleton style={{ width: 200, height: 20, borderRadius: 4 }} />
```

## Compose

```kotlin
import vn.momo.kits.components.Skeleton

Skeleton()   // no params — fills maxWidth/maxHeight via BoxWithConstraints
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Size | Via `style` prop | Fills parent via `BoxWithConstraints` |
| Dimensions | `width`, `height`, `borderRadius` in `style` | No params |

