# Information

## React Native

```tsx
import { Information } from '@momo-kits/information';

<Information
  title="Note"                     // optional title text
  description="Important info"    // required description text
  type="info"                     // 'default'|'warning'|'error'|'success' (default: 'default')
  image="https://..."             // optional image URL (replaces the icon)
  CTA="Retry"                     // optional CTA button text
  onPressCTA={() => {}}          // CTA button pressed callback
  showIcon={true}                 // show/hide leading icon (default: true)
  showIconClose={true}            // show/hide close icon (default: true)
  onPressClose={() => {}}        // close icon pressed callback
  style={{}}                      // optional custom styles
  accessibilityLabel="note_block"  // optional accessibility label
/>
```

Package: `@momo-kits/information` (separate lib).

## Compose

```kotlin
import vn.momo.kits.components.Information
import vn.momo.kits.components.InformationState

Information(
    modifier = Modifier,                        // optional modifier
    title = "Note",                             // optional title text
    description = "Important info",            // description text (default: "Description")
    state = InformationState.DEFAULT,           // DEFAULT | WARNING | ERROR (default: DEFAULT)
    image = "https://...",                      // optional image URL (replaces the icon)
    onPressAction = {},                          // CTA button pressed callback
    showIcon = true,                            // show/hide leading icon (default: true)
    action = "Retry",                           // optional CTA button text
    showIconClose = true,                       // show/hide close icon (default: true)
    onPressClose = {},                          // close icon pressed callback
)
```

### TrustBanner (Compose only)

```kotlin
import vn.momo.kits.components.TrustBanner

TrustBanner(data = trustBannerData)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Package | `@momo-kits/information` | `vn.momo.kits.components` |
| State type | String (`type`) | Enum (`InformationState`) |
| CTA prop | `CTA` + `onPressCTA` | `action` + `onPressAction` |
| Style/Modifier | `style` prop | `modifier` param |
| Accessibility | `accessibilityLabel` prop | Not available |
