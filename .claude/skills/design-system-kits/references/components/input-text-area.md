# InputTextArea Reference

Multi-line text input with character counting and max length.

## React Native

```tsx
import { InputTextArea } from '@momo-kits/foundation';

const textAreaRef = useRef<InputRef>(null);

<InputTextArea
  ref={textAreaRef}
  floatingValue="Description"
  floatingIcon="info_small"
  floatingIconColor={theme.colors.text.hint}
  value={text}
  onChangeText={setText}
  placeholder="Enter description..."
  height={120}
  maxLength={500}
  errorMessage=""
  hintText="Max 500 characters"
  required={false}
  disabled={false}
  onFocus={(e) => {}}
  onBlur={(e) => {}}
  defaultValue=""
  style={{}}
  accessibilityLabel="description_input"
  params={{ field: 'description' }}
/>

// Ref methods
textAreaRef.current?.clear();
textAreaRef.current?.focus();
textAreaRef.current?.blur();
textAreaRef.current?.setText('new text');
```

### Props

Extends `InputProps` (same as Input) but **without `size`**.

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `height` | `number` | — | Custom height for the text area |
| `maxLength` | `number` | `300` | Character limit (shows counter) |
| `floatingValue` | `string` | — | Floating label text |
| `floatingIcon` | `string` | — | Icon shown beside floating label |
| `floatingIconColor` | `string` | — | Color of floating icon |
| `errorMessage` | `string` | — | Error message below input |
| `errorSpacing` | `boolean` | `false` | Reserve space for error |
| `hintText` | `string` | — | Hint text below input |
| `required` | `boolean` | `false` | Show required indicator |
| `disabled` | `boolean` | `false` | Disable input |
| `onFocus` | `(e) => void` | — | Focus event handler |
| `onBlur` | `(e) => void` | — | Blur event handler |
| `placeholder` | `string` | — | Placeholder text |
| `defaultValue` | `string` | — | Initial value (uncontrolled) |
| `style` | `ViewStyle` | — | Custom wrapper style |
| `params` | `any` | — | Auto tracking params |
| `accessibilityLabel` | `string` | — | Accessibility label |

## Compose

```kotlin
import vn.momo.kits.components.InputTextArea
import vn.momo.kits.components.InputSize
import vn.momo.kits.components.InputFontWeight

val text = remember { mutableStateOf("") }

InputTextArea(
    text = text,
    floatingValue = "Description",
    floatingIcon = "",
    floatingIconColor = AppTheme.current.colors.text.default,
    placeholder = "Enter description...",
    height = 104.dp,
    maxLength = 300,
    size = InputSize.SMALL,
    onChangeText = { },
    error = "",
    errorSpacing = false,
    required = false,
    disabled = false,
    loading = false,
    icon = "",
    iconColor = AppTheme.current.colors.text.default,
    onRightIconPressed = { },
    onFocus = { },
    onBlur = { },
    fontWeight = InputFontWeight.REGULAR,
    keyboardType = KeyboardType.Text,
    modifier = Modifier,
)
```

> **Note:** Compose uses `MutableState<String>` for `text` and `error` (String, not `errorMessage`). Height defaults to `104.dp`. Max character count and clear icon are shown automatically when focused.
