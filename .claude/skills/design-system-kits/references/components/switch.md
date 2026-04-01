# Switch

## React Native

```tsx
import { Switch } from '@momo-kits/foundation';

<Switch
  value={enabled}                     // current toggle state (default: false)
  onChange={(enabled) => setEnabled(enabled)}  // called with new boolean value
  disabled={false}                    // disable the switch (default: false)
  style={{}}                         // optional custom styles
  accessibilityLabel="toggle_notifications"  // accessibility label
  params={{ field: 'notifications' }}       // auto tracking params
/>
```

## Compose

```kotlin
import vn.momo.kits.components.Switch

Switch(
    value = isEnabled,                    // current toggle state (default: false)
    onChange = { enabled -> },          // called with new boolean value
    disabled = false,                    // disable the switch (default: false)
    title = "Notifications",             // optional label text
    accessibilityId = "toggle_notifications",  // automation ID
    modifier = Modifier,                  // optional modifier
)
```

Same API naming on both platforms (`value`, `onChange`). Compose adds `title` and `accessibilityId`.

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Value prop | `value` | `value` |
| Change handler | `onChange` | `onChange` |
| Label | Not built-in (wrap in `Text`) | `title` param |
| Automation ID | `accessibilityLabel` | `accessibilityId` |
| Modifier/Style | `style` prop | `modifier` param |
