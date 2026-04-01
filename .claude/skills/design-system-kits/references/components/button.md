# Button Reference

## React Native

```tsx
import { Button } from '@momo-kits/foundation';

<Button
  title="Click me"               // button label
  type="primary"                  // 'primary'|'secondary'|'tonal'|'outline'|'danger'|'text'|'disabled'
  size="large"                    // 'large'|'medium'|'small'
  full                            // full-width button (default: true)
  iconLeft={iconSource}           // left icon
  iconRight={iconSource}          // right icon
  loading={false}                 // show spinner
  disabled={false}                // disable interaction
  onPress={() => {}}             // press handler
  tintColor={Colors.pink_03}      // custom tint
  gradientConfig={{               // custom gradient
    colors: ['#ff0', '#f00'],
    start: { x: 0, y: 0 },
    end: { x: 1, y: 0 },
  }}
  accessibilityLabel="submit"     // QA automation ID
  accessibilityState={{ disabled: true }}
  params={{ action: 'submit' }}  // tracking params
/>
```

---

## Compose

```kotlin
import vn.momo.kits.components.Button
import vn.momo.kits.components.ButtonType
import vn.momo.kits.components.Size

Button(
    onClick = { /* action */ },
    type = ButtonType.PRIMARY,     // PRIMARY, SECONDARY, TONAL, OUTLINE, DANGER, TEXT, DISABLED
    size = Size.LARGE,             // LARGE (48dp), MEDIUM (36dp), SMALL (28dp)
    title = "Button",
    iconLeft = "",                 // icon source string
    iconRight = "",
    loading = false,               // show spinner
    useTintColor = false,         // tint icons to match text color (default: false)
    isFull = true,                // full-width (default: true)
    modifier = Modifier,
)
```

Button sizes map to typography: LARGE → `actionDefaultBold`, MEDIUM → `actionSBold`, SMALL → `actionXsBold`.

---

## Side-by-Side Example

| Feature | React Native | Compose |
|---------|-------------|---------|
| Type prop | `type="primary"` (string) | `type = ButtonType.PRIMARY` (enum) |
| Size prop | `size="large"` (string) | `size = Size.LARGE` (enum) |
| Full width | `full` (boolean shorthand) | `isFull = true` |
| Press handler | `onPress={fn}` | `onClick = { fn() }` |
| Icon | `iconLeft={source}` (ImageSource) | `iconLeft = "icon_name"` (String) |
