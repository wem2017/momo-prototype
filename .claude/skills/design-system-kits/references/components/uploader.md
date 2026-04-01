# Uploader

## React Native

```tsx
import { Uploader } from '@momo-kits/uploader';

const files: UploadImage[] = [];

<Uploader
  images={files}
  numberOfImages={5}
  disabled={false}
  width={64}
  height={64}
  onAdd={() => launchImagePicker()}
  onCancel={(image, index) => removeFile(index)}
  onPressImage={(image, index) => previewImage(image)}
/>
```

### UploadImage

| Prop | Type | Description |
|------|------|-------------|
| `uri` | `string` | Image URL or local path |
| `loading` | `boolean` | Shows loading indicator |

Package: `@momo-kits/uploader`

## Compose

```kotlin
import vn.momo.kits.components.Uploader
import vn.momo.kits.components.UploadImage

Uploader(
    images = listOf(
        UploadImage(uri = "https://...", loading = false),
    ),
    numberOfImages = 5,
    disabled = false,
    width = 64.dp,
    height = 64.dp,
    onAdd = { launchPicker() },
    onCancel = { image, index -> },        // null = hide cancel button
    onPressImage = { image, index -> },
)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Image data | `{ uri, loading }[]` | `List<UploadImage>` |
| Cancel button | Always shown | `onCancel = null` hides it |
| Layout | Fixed grid | Horizontal scroll row |
| Dashed border | Built-in | `Modifier.dashedBorder` |
| Loading overlay | Built-in | White 40% + `Skeleton` |
