# Radio

## React Native

```tsx
import { Radio } from '@momo-kits/foundation';

<Radio
  value="option1"
  groupValue={selectedValue}
  onChange={() => setSelectedValue("option1")}   // caller sets the value
  label="Option 1"
  disabled={false}
  style={{}}
  params={{ field: 'option' }}
  accessibilityState={{ disabled: false }}
  accessibilityLabel="option_1"
/>
```

## Compose

```kotlin
import vn.momo.kits.components.Radio

var selectedValue by remember { mutableStateOf("option1") }

Radio(
    value = "option1",
    groupValue = selectedValue,
    onChange = { selectedValue = "option1" },    // caller sets the value
    label = "Option A",
    disabled = false,
    modifier = Modifier,
)
```

| Feature | React Native | Compose |
|---------|-------------|---------|
| Selection model | `value` + `groupValue` | `value` + `groupValue` |
| Change handler | `onChange()` caller sets value | `onChange()` caller sets value |
| Label prop | `label` | `label` |
