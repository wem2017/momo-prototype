# InputSearch Reference

Search bar input with cancel button, clear icon, and typing animation support.

## React Native

```tsx
import { InputSearch } from '@momo-kits/foundation';

const searchRef = useRef<InputRef>(null);

<InputSearch
  ref={searchRef}
  placeholder="Search..."
  value={query}
  onChangeText={setQuery}
  defaultValue="initial query"      // uncontrolled default value
  buttonText="Cancel"
  showButtonText={true}
  onPressButtonText={() => navigation.goBack()}
  trailing="24_qr_code"
  trailingColor={theme.colors.primary}
  onPressTrailing={() => openScanner()}
  backgroundColor={theme.colors.background.surface}
  onFocus={() => {}}
  onBlur={() => {}}
  style={{}}
  params={{ action: 'search' }}
/>
```

### With Typing Animation

When `typingData` is provided, the input becomes non-editable and shows an animated typing effect. Tap triggers `onPress`.

```tsx
<InputSearch
  typingData={['Search for food...', 'Search for drinks...', 'Search for deals...']}
  onPress={() => navigateToFullSearch()}
/>
```

### Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `placeholder` | `string` | — | Placeholder text |
| `value` | `string` | — | Controlled value |
| `onChangeText` | `(text: string) => void` | — | Text change handler |
| `defaultValue` | `string` | — | Uncontrolled default value |
| `buttonText` | `string` | `'Hủy'` | Cancel button text |
| `showButtonText` | `boolean` | `true` | Show/hide cancel button |
| `onPressButtonText` | `() => void` | — | Cancel button press handler |
| `trailing` | `string` | — | Trailing icon name |
| `trailingColor` | `string` | — | Trailing icon color |
| `onPressTrailing` | `() => void` | — | Trailing icon press handler |
| `backgroundColor` | `string` | `theme.colors.background.surface` | Background color |
| `typingData` | `string[]` | — | Array of strings for typing animation |
| `onPress` | `(e) => void` | — | Press handler (used with typingData) |
| `onFocus` | `(e) => void` | — | Focus handler |
| `onBlur` | `(e) => void` | — | Blur handler |
| `style` | `StyleProp<ViewStyle>` | — | Custom styles |
| `params` | `any` | — | Auto tracking params |

### Ref Methods

```tsx
searchRef.current?.clear();
searchRef.current?.focus();
searchRef.current?.blur();
searchRef.current?.setText('new text');
```

## Compose

```kotlin
import vn.momo.kits.components.InputSearch
import vn.momo.kits.components.InputSearchProps
import vn.momo.kits.components.InputFontWeight
import androidx.compose.runtime.MutableState

val text = remember { mutableStateOf("") }

InputSearch(
    inputSearchProps = InputSearchProps(
        text = text,                          // MutableState<String> holding the text value
        placeholder = "Search...",            // placeholder text (default: "")
        onChangeText = { value -> },         // called when text changes
        buttonText = "Cancel",               // cancel button text (default: "")
        showButtonText = false,              // show/hide cancel button (default: false)
        onPressButtonText = {},              // cancel button pressed callback
        disabled = false,                     // disable input (default: false)
        icon = "",                           // trailing icon name (right side)
        iconColor = Color.Unspecified,        // trailing icon color (default: Color.Unspecified)
        onRightIconPressed = {},             // trailing icon pressed callback
        onFocus = {},                        // focus callback
        onBlur = {},                         // blur callback
        loading = false,                     // show loading indicator on trailing icon
        fontWeight = InputFontWeight.REGULAR, // REGULAR | BOLD (default: REGULAR)
        keyboardType = KeyboardType.Text,    // Compose KeyboardType (default: Text)
        backgroundColor = Color.Black,       // background color (default: Colors.black_01)
        clearCondition = { true },           // custom condition to show clear icon
        onClearPress = {},                   // called when clear icon is pressed
        keyboardOptions = KeyboardOptions.Default,  // Compose KeyboardOptions
        keyboardActions = KeyboardActions.Default,  // Compose KeyboardActions
        modifier = Modifier,                  // optional modifier
        iconModifier = Modifier,              // modifier for trailing icon
        leftPosition = null,                  // custom left position (Dp?)
    ),
)
```

> **Note:** Compose `InputSearch` does **not** support `typingData` (animated typing) or `defaultValue` — these are RN-only.

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Value binding | `value` + `onChangeText` | `MutableState<String>` via `InputSearchProps.text` |
| Trailing icon | `trailing` + `trailingColor` + `onPressTrailing` | `icon` + `iconColor` + `onRightIconPressed` |
| Button visibility | `showButtonText` default `true` | `showButtonText` default `false` |
| Imperative ref | `clear`, `focus`, `blur`, `setText` | Not available |
| Font weight | Via `style` | `InputFontWeight` enum |
| Clear icon | Auto-shown when focused and has value | Via `clearCondition` callback |
| Modifier | `style` prop | `modifier` + `iconModifier` |
| Typing animation | Supported via `typingData` | Not available |
| Default value | `defaultValue` prop (uncontrolled) | Not available |
