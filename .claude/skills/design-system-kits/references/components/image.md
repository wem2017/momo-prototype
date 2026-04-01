# Image

## React Native

```tsx
import { Image } from '@momo-kits/foundation';

<Image
  source={{ uri: 'https://...' }}
  style={{ width: 100, height: 100 }}
  loading                          // show loading indicator
  accessibilityLabel="profile"
/>

// With children overlay (e.g., badge, gradient)
<Image source={{ uri: 'https://...' }} style={{ width: 100, height: 100 }}>
  <Badge label="New" />
</Image>
```

## Compose

```kotlin
import vn.momo.kits.components.Image
import vn.momo.kits.components.Options
import androidx.compose.ui.graphics.ContentScale
import androidx.compose.ui.Alignment

Image(
    source = "https://...",        // Any: URL string, drawable, Painter
    modifier = Modifier.fillMaxWidth().aspectRatio(16f/9f),
    loading = true,                // show skeleton while loading; default: true
    options = Options(            // optional
        alignment = Alignment.Center,
        contentScale = ContentScale.Crop,
        colorFilter = null,
        alpha = 1f,
    ),
)

// Painter overload (no loading/error state)
Image(source = painterResource("drawable/ic_avatar"))
```

### Options

| Param | Type | Default |
|-------|------|---------|
| `alignment` | `Alignment` | `Alignment.TopStart` |
| `contentScale` | `ContentScale` | `ContentScale.Crop` |
| `colorFilter` | `ColorFilter?` | `null` |
| `alpha` | `Float` | `1f` |

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Source | `{{ uri: 'url' }}` (object) | `Any` (string, drawable, Painter) |
| Sizing | `style={{ width, height }}` | `Modifier.width().height()` |
| Loading | `loading` prop | `loading` param |
| Children overlay | RN: yes (JSX children) | Compose: use `Box` + `Image` separately |
| Auto resize | — | Auto-appends `?size=XXS…XXL` for supported CDN domains |
