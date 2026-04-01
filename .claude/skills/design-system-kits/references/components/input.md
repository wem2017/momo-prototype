# Input Reference

Base text input with floating label, leading/trailing icons, and validation.

## React Native

```tsx
import { Input } from '@momo-kits/foundation';

const inputRef = useRef<InputRef>(null);

<Input
  ref={inputRef}
  size="large"
  floatingValue="Email"
  value={text}
  onChangeText={setText}
  placeholder="Enter email"
  leadingIcon="24_mail"
  leadingIconColor={theme.colors.text.hint}
  onPressLeadingIcon={() => {}}
  trailing="24_check_circle"
  trailingColor={theme.colors.success.primary}
  onPressTrailing={() => {}}
  errorMessage="Invalid email"
  errorSpacing={true}
  hintText="We'll never share your email"
  required={true}
  disabled={false}
  loading={false}
  showClearIcon={true}
  secureTextEntry={false}
  keyboardType="email-address"
  accessibilityLabel="email_input"
  params={{ field: 'email' }}
/>

// Ref methods
inputRef.current?.clear();
inputRef.current?.focus();
inputRef.current?.blur();
inputRef.current?.setText('new text');
```

### Props

Extends `TextInputProps` — supports `value`, `onChangeText`, `placeholder`, `defaultValue`, `editable`, `secureTextEntry`, `keyboardType`, etc.

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `size` | `'small' \| 'large'` | `'small'` | Input size variant |
| `floatingValue` | `string` | — | Floating label text |
| `floatingIcon` | `string` | — | Icon next to floating label |
| `floatingIconColor` | `string` | — | Color of floating icon |
| `onPressFloatingIcon` | `() => void` | — | Floating icon press handler |
| `leadingIcon` | `string` | — | Leading icon name |
| `leadingIconColor` | `string` | — | Leading icon color |
| `onPressLeadingIcon` | `() => void` | — | Leading icon press handler |
| `trailing` | `string` | — | Trailing icon name |
| `trailingColor` | `string` | — | Trailing icon color |
| `onPressTrailing` | `() => void` | — | Trailing icon press handler |
| `errorMessage` | `string` | — | Error message below input |
| `errorSpacing` | `boolean` | `false` | Reserve space for error when empty |
| `hintText` | `string` | — | Hint text below input |
| `required` | `boolean` | `false` | Show required indicator |
| `disabled` | `boolean` | `false` | Disable input |
| `loading` | `boolean` | `false` | Show loading indicator |
| `showClearIcon` | `boolean` | `true` | Show clear text icon |
| `params` | `any` | — | Auto tracking params |

## Compose

```kotlin
import vn.momo.kits.components.Input
import vn.momo.kits.components.InputSize
import vn.momo.kits.components.InputFontWeight
import androidx.compose.runtime.MutableState

val text = remember { mutableStateOf("") }

Input(
    text = text,                              // MutableState<String> holding the text value
    floatingValue = "Email",                 // floating label text (default: "")
    floatingValueColor = Color.Unspecified,   // floating label color (default: theme hint)
    floatingIcon = "",                       // icon next to floating label
    floatingIconColor = Color.Unspecified,    // floating icon color (default: theme default)
    placeholder = "",                        // placeholder text (default: "")
    size = InputSize.SMALL,                 // SMALL | LARGE (default: SMALL)
    onChangeText = { value -> },            // called when text changes
    hintText = "",                          // hint text below input
    error = "",                             // error message text (note: not errorMessage)
    errorSpacing = false,                   // reserve space for error when empty
    disabled = false,                        // disable input
    readOnly = false,                       // make input read-only
    secureTextEntry = false,                // hide text (password mode)
    icon = "",                              // trailing icon name
    iconColor = Color.Unspecified,           // trailing icon color
    onRightIconPressed = {},                // trailing icon pressed callback
    leadingIcon = "",                      // leading icon name (left side)
    leadingIconColor = Color.Unspecified,    // leading icon color
    onFocus = {},                           // focus callback
    onBlur = {},                           // blur callback
    loading = false,                       // show loading indicator on trailing icon
    required = false,                      // show required indicator on floating label
    fontWeight = InputFontWeight.REGULAR,  // REGULAR | BOLD (default: REGULAR)
    keyboardType = KeyboardType.Text,      // Compose KeyboardType (default: Text)
    modifier = Modifier,                    // optional modifier
    inputModifier = Modifier,               // modifier for the input field itself
)
```

> **Note:** Compose `Input` uses `MutableState<String>` for `text` (controlled). The `error` param is `String` (not `errorMessage`). The trailing icon doubles as a password visibility toggle when `secureTextEntry` is enabled.

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Value binding | `value` + `onChangeText` | `MutableState<String>` via `text` param |
| Error prop | `errorMessage` | `error` |
| Size type | String (`'small' \| 'large'`) | Enum (`InputSize.SMALL \| LARGE`) |
| Font weight | `fontWeight` (string) | `InputFontWeight` enum |
| Floating label color | Via `floatingIconColor` only | Via `floatingValueColor` + `floatingIconColor` |
| Trailing icon | `trailing` + `trailingColor` + `onPressTrailing` | `icon` + `iconColor` + `onRightIconPressed` |
| Password toggle | Native `secureTextEntry` | Auto-handled (icon doubles as visibility toggle) |
| Imperative ref | `clear`, `focus`, `blur`, `setText` | Not available |
| Modifier | `style` prop | `modifier` + `inputModifier` |
