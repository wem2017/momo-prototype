# InputDropDown Reference

Non-editable dropdown trigger input. Displays a value and opens a selection UI on press.

## React Native

```tsx
import { InputDropDown } from '@momo-kits/foundation';

<InputDropDown
  floatingValue="Select Province"
  floatingIcon="info_small"
  floatingIconColor={theme.colors.text.hint}
  onPressFloatingIcon={() => {}}
  value={selectedProvince}
  placeholder="Choose..."
  size="large"
  onPress={() => openProvinceSelector()}
  leadingIcon="24_location"
  leadingIconColor={theme.colors.text.hint}
  onPressLeadingIcon={() => {}}
  errorMessage=""
  hintText=""
  required={true}
  disabled={false}
  loading={false}
  multiline={false}
  params={{ field: 'province' }}
  style={{}}
  accessibilityLabel="province_selector"
/>
```

### Props

Extends `TouchableOpacityProps` — triggers `onPress` when tapped.

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `size` | `'small' \| 'large'` | `'large'` | Input size variant |
| `value` | `string` | — | Display value |
| `placeholder` | `string` | — | Placeholder when empty |
| `multiline` | `boolean` | `false` | Allow multi-line display |
| `floatingValue` | `string` | — | Floating label text |
| `floatingIcon` | `string` | — | Icon shown beside floating label |
| `floatingIconColor` | `string` | — | Color of floating icon |
| `onPressFloatingIcon` | `() => void` | — | Press handler for floating icon |
| `leadingIcon` | `string` | — | Leading icon name |
| `leadingIconColor` | `string` | — | Leading icon color |
| `onPressLeadingIcon` | `() => void` | — | Leading icon press handler |
| `errorMessage` | `string` | — | Error message below input |
| `errorSpacing` | `boolean` | `false` | Reserve space for error |
| `hintText` | `string` | — | Hint text below input |
| `required` | `boolean` | `false` | Show required indicator |
| `disabled` | `boolean` | `false` | Disable input |
| `loading` | `boolean` | `false` | Show loading indicator |
| `params` | `any` | — | Auto tracking params |
| `style` | `ViewStyle` | — | Custom wrapper style |
| `accessibilityLabel` | `string` | — | Accessibility label |

## Compose

```kotlin
import vn.momo.kits.components.InputDropDown
import vn.momo.kits.components.InputSize

val selectedValue = remember { mutableStateOf("") }

InputDropDown(
    value = selectedValue,
    floatingValue = "Select Option",
    floatingValueColor = AppTheme.current.colors.text.hint,
    floatingIcon = "",
    floatingIconColor = AppTheme.current.colors.text.default,
    placeholder = "Choose...",
    size = InputSize.SMALL,
    onPress = { openSelector() },
    hintText = "",
    error = "",
    errorSpacing = false,
    disabled = false,
    loading = false,
    required = false,
    icon = "arrow_chevron_down_small",
    iconColor = AppTheme.current.colors.text.default,
    onRightIconPressed = { },
    leadingIcon = "",
    leadingIconColor = AppTheme.current.colors.text.hint,
)
```

> **Note:** Compose uses `MutableState<String>` for `value` and `error` (String, not `errorMessage`). The default trailing icon is `"arrow_chevron_down_small"`.
