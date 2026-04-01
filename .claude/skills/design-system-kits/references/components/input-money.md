# InputMoney Reference

Currency-formatted numeric input with automatic number formatting and currency symbol.

## React Native

```tsx
import { InputMoney } from '@momo-kits/foundation';

const moneyRef = useRef<InputRef>(null);

<InputMoney
  ref={moneyRef}
  value={amount}                  // current value (numeric string without separators)
  onChangeText={setAmount}        // called with raw numeric value on change
  floatingValue="Amount"          // floating label text
  floatingIcon=""                 // optional icon name next to floating label
  floatingIconColor={}           // floating icon color
  size="small"                    // 'small' | 'large' (default: 'small')
  placeholder="0đ"                // placeholder text (default: '0đ')
  currency="đ"                    // currency symbol appended after number (default: 'đ')
  errorMessage=""                 // error message text
  errorSpacing={false}            // reserve space for error even when no error
  hintText=""                     // hint text below input
  trailing=""                     // trailing icon name
  trailingColor={}                // trailing icon color
  onPressTrailing={() => {}}     // trailing icon pressed callback
  required={false}               // show required indicator on floating label
  disabled={false}                // disable input
  loading={false}                 // show loading indicator on trailing icon
  showClearIcon={true}            // show clear icon when focused and has value
  onFocus={() => {}}             // focus callback
  onBlur={() => {}}              // blur callback
  onPressFloatingIcon={() => {}}  // floating icon pressed callback
  style={{}}                      // optional custom styles
  params={{}}                     // auto tracking params
  maxLength={15}                  // max digit length
/>

// Ref methods
moneyRef.current?.clear();               // clear input
moneyRef.current?.focus();               // focus input
moneyRef.current?.blur();                // blur input
moneyRef.current?.setText('100000');     // set input value programmatically
```

Input automatically formats numbers with thousand separators (e.g., `1,000,000đ`). Only accepts numeric input.

### Props

Extends `InputProps` with money-specific additions.

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `value` | `string` | — | Current value (raw numeric string without separators) |
| `onChangeText` | `(value: string) => void` | — | Callback with raw numeric value on change |
| `currency` | `string` | `'đ'` | Currency symbol |
| `size` | `'small' \| 'large'` | `'small'` | Input size variant |
| `floatingValue` | `string` | — | Floating label text |
| `floatingIcon` | `string` | — | Icon name next to floating label |
| `floatingIconColor` | `string` | — | Floating icon color |
| `placeholder` | `string` | `'0đ'` | Placeholder text |
| `maxLength` | `number` | — | Max digit length |
| `trailing` | `string` | — | Trailing icon name |
| `trailingColor` | `string` | — | Trailing icon color |
| `onPressTrailing` | `() => void` | — | Trailing icon press handler |
| `errorMessage` | `string` | — | Error message |
| `errorSpacing` | `boolean` | `false` | Reserve space for error |
| `hintText` | `string` | — | Hint text |
| `required` | `boolean` | `false` | Show required indicator |
| `disabled` | `boolean` | `false` | Disable input |
| `loading` | `boolean` | `false` | Show loading indicator |
| `showClearIcon` | `boolean` | `true` | Show clear icon |
| `onFocus` | `() => void` | — | Focus callback |
| `onBlur` | `() => void` | — | Blur callback |
| `onPressFloatingIcon` | `() => void` | — | Floating icon press handler |
| `style` | `StyleProp<ViewStyle>` | — | Custom styles |
| `params` | `any` | — | Auto tracking params |

## Compose

```kotlin
import vn.momo.kits.components.InputMoney
import vn.momo.kits.components.InputSize
import vn.momo.kits.components.InputFontWeight
import androidx.compose.runtime.MutableState

val amount = remember { mutableStateOf("0") }

InputMoney(
    text = amount,                         // MutableState<String> holding raw numeric value
    floatingValue = "Amount",             // floating label text (default: "")
    floatingValueColor = Color.Unspecified, // floating label color (default: theme hint)
    floatingIcon = "",                    // optional icon name next to floating label
    floatingIconColor = Color.Unspecified,  // floating icon color (default: theme default)
    placeholder = "0đ",                  // placeholder text (default: "0đ")
    size = InputSize.SMALL,               // SMALL | LARGE (default: SMALL)
    onChangeText = { value -> },          // called with raw numeric value on change
    error = "",                           // error message text
    errorSpacing = false,                 // reserve space for error even when no error
    disabled = false,                     // disable input
    icon = "",                            // trailing icon name
    iconColor = Color.Unspecified,        // trailing icon color
    onPressIcon = {},                     // trailing icon pressed callback
    leadingIcon = "",                     // leading icon name (left side)
    leadingIconColor = Color.Unspecified, // leading icon color
    onFocus = {},                         // focus callback
    onBlur = {},                          // blur callback
    loading = false,                      // show loading indicator on trailing icon
    required = false,                    // show required indicator on floating label
    fontWeight = InputFontWeight.BOLD,    // REGULAR | BOLD (default: BOLD)
    keyboardType = KeyboardType.Number,   // Compose KeyboardType
)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Value binding | `value` + `onChangeText` | `MutableState<String>` via `text` param |
| Error prop | `errorMessage` | `error` |
| Size type | String (`'small' \| 'large'`) | Enum (`InputSize.SMALL \| LARGE`) |
| Font weight | `fontWeight` (string) | `InputFontWeight` enum |
| Imperative ref | `clear`, `focus`, `blur`, `setText` | Not available |
| Leading icon | Via `leadingIcon` prop | Via `leadingIcon` param |
| Max length | `maxLength` prop | Not available |
| Currency customization | `currency` prop | Not available (hardcoded `đ` via visual transformation) |

