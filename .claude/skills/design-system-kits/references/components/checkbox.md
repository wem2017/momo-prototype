# CheckBox

## React Native

```tsx
import { CheckBox } from '@momo-kits/foundation';

<CheckBox
  value={checked}
  onChange={setChecked}
  label="Accept terms"
  disabled={false}
  indeterminate={false}           // partial selection state
  accessibilityState={{ checked: true, disabled: false }}
  params={{ field: 'terms' }}     // tracking
/>
```

## Compose

```kotlin
import vn.momo.kits.components.CheckBox

CheckBox(
    checked = isChecked,
    onCheckedChange = { isChecked = it },
    title = "Accept terms",                 // optional label
    disabled = false,
    indeterminate = false,                  // partial state (minus icon)
)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Value prop | `value` | `checked` |
| Change handler | `onChange` | `onCheckedChange` |
| Label prop | `label` | `title` |
