# InputPhoneNumber Reference

Phone number input with +84 country code prefix and number formatting.

## React Native

```tsx
import { InputPhoneNumber } from '@momo-kits/foundation';

const phoneRef = useRef<InputRef>(null);

<InputPhoneNumber
  ref={phoneRef}
  size="small"
  value={phone}
  onChangeText={setPhone}
  placeholder="0123456789"
  trailing="24_check_circle"
  trailingColor={theme.colors.success.primary}
  onPressTrailing={() => {}}
  errorMessage=""
  hintText=""
  disabled={false}
  loading={false}
  showClearIcon={true}
  editable={true}
  secureTextEntry={false}
  keyboardType="number-pad"
  params={{}}
  accessibilityLabel="phone_input"
/>

// Ref methods
phoneRef.current?.clear();
phoneRef.current?.focus();
phoneRef.current?.blur();
phoneRef.current?.setText('0901234567');
```

### Props

Extends `InputProps` with phone-specific defaults.

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `size` | `'small' \| 'large'` | `'small'` | Input size variant |
| `placeholder` | `string` | `'0123456789'` | Placeholder text |
| `keyboardType` | `string` | `'number-pad'` | Keyboard type |
| `trailing` | `string` | — | Trailing icon name |
| `trailingColor` | `string` | — | Trailing icon color |
| `onPressTrailing` | `() => void` | — | Trailing icon press handler |
| `errorMessage` | `string` | — | Error message |
| `errorSpacing` | `boolean` | `false` | Reserve space for error |
| `hintText` | `string` | — | Hint text |
| `disabled` | `boolean` | `false` | Disable input |
| `loading` | `boolean` | `false` | Show loading indicator on trailing |
| `showClearIcon` | `boolean` | `true` | Show clear icon when focused |
| `editable` | `boolean` | `true` | Allow text editing |
| `secureTextEntry` | `boolean` | `false` | Mask input text |
| `params` | `any` | — | Auto tracking params |
| `accessibilityLabel` | `string` | — | Accessibility label |
| `defaultValue` | `string` | — | Initial value (uncontrolled) |

### Utility

```tsx
import { checkValidPhoneNumber } from '@momo-kits/foundation';

const isValid = checkValidPhoneNumber('0901234567'); // true
```

## Compose

```kotlin
import vn.momo.kits.components.InputPhoneNumber
import vn.momo.kits.components.InputPhoneNumberSize

val phone = remember { mutableStateOf("") }

InputPhoneNumber(
    text = phone,
    onChangeText = { phone.value = it },
    placeholder = "0123456789",
    size = InputPhoneNumberSize.SMALL,     // InputPhoneNumberSize.SMALL | LARGE; default: SMALL
    hintText = "",
    error = "",                           // error message; default: ""
    errorSpacing = false,
    icon = "",                            // trailing icon name
    iconColor = AppTheme.current.colors.text.default,
    onRightIconPressed = { },
    onFocus = { },
    onBlur = { },
    loading = false,
    inputModifier = Modifier,
)
```
