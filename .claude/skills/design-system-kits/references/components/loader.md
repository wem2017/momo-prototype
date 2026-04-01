# Loader

## React Native

```tsx
import { Loader } from '@momo-kits/foundation';

<Loader type="spinner" />         // 'dot'|'spinner'
```

## Compose

```kotlin
import vn.momo.kits.components.Loader
import vn.momo.kits.components.LoaderType
import vn.momo.kits.components.ProgressBar

// Unified entry-point
Loader(
    type = LoaderType.DOT,       // DOT | SPINNER; default: DOT
    tintColor = null,
    modifier = Modifier,
)

// Progress bar (determinate)
ProgressBar(
    percent = 75f,               // 0–100; clamped
    color = null,               // default: theme.primary
    modifier = Modifier,
)
```

`Loader` (DOT/SPINNER) = indeterminate loading. `ProgressBar` = animated determinate progress bar.

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Loading types | `type="dot"\|"spinner"` | `LoaderType` enum |
| Determinate progress | Not available | `ProgressBar` composable |
| Lottie | Built-in | `LottieAnimation` |
