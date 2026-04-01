# ProgressInfo

Step-based progress indicator with horizontal and vertical layouts.

## React Native

```tsx
import { ProgressInfo } from '@momo-kits/progress-info';

<ProgressInfo
  horizontal={false}                  // true = horizontal layout, false = vertical (default: false)
  steps={[
    { title: 'Step 1', description: 'Description for step 1' },
    { title: 'Step 2', description: 'Description for step 2' },
    { title: 'Step 3', description: 'Description for step 3' },
  ]}
  size="large"                       // 'small' | 'large' (default: 'large')
  useNumber={false}                   // show step numbers instead of dots (default: false)
  customIcon="ic_check"              // custom icon name to display in each step
  showTitle={true}                   // show/hide step titles (default: true)
  showDescription={true}             // show/hide step descriptions (default: true)
  align="center"                     // 'left' | 'right' | 'center' | 'stretch' (horizontal only)
/>
```

Package: `@momo-kits/progress-info`

### ProgressInfoItem

```tsx
type ProgressInfoItem = {
  title: string;          // step title (required)
  description?: string;  // step description (optional)
};
```

## Compose

```kotlin
import vn.momo.kits.components.ProgressInfo
import vn.momo.kits.components.ProgressInfoItem
import vn.momo.kits.components.ProgressInfoSize
import vn.momo.kits.components.ProgressInfoAlign

ProgressInfo(
    steps = listOf(
        ProgressInfoItem(title = "Step 1", description = "Desc 1"),
        ProgressInfoItem(title = "Step 2", description = "Desc 2"),
    ),
    horizontal = false,
    size = ProgressInfoSize.Large,     // Small | Large
    useNumber = false,
    showTitle = true,
    showDescription = true,
    align = ProgressInfoAlign.Center,  // Left | Right | Center | Stretch
    customIcon = null,
    modifier = Modifier,
)
```

> **Note:** Display-only indicator (no active state, no onPress). Use `Steps` for interactive variant.

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Step data | `steps` array | `List<ProgressInfoItem>` |
| Size | `string` | `ProgressInfoSize` enum |
| Align | `string` | `ProgressInfoAlign` enum |
| Active / onPress | Not available | Display-only |
