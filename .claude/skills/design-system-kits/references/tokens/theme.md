# Theme Reference

The theme system provides semantic color mappings for light/dark mode support.

## Accessing Theme

| Platform | Access |
|----------|--------|
| React Native | `const { theme } = useContext(ApplicationContext)` |
| Compose | `val theme = AppTheme.current` |

Both expose an identical structure:

```
theme.colors.primary           → Color (pink_03 light / pink_04 dark)
theme.colors.secondary         → Color
theme.colors.gradient          → Color
theme.colors.background.default / .surface / .tonal / .pressed / .selected / .disable
theme.colors.text.default / .secondary / .hint / .disable
theme.colors.border.default / .disable
theme.colors.success.primary / .secondary / .container
theme.colors.warning.primary / .secondary / .container
theme.colors.error.primary / .secondary / .container
theme.colors.highlight.primary / .secondary / .container
theme.colors.interactive.primary / .secondary / .container
```

---

## Light Theme (defaultTheme)

| Path | Value |
|------|-------|
| `primary` | `pink_03` (#EB2F96) |
| `secondary` | `pink_07` |
| `gradient` | #FDCADE |
| `background.default` | #F2F2F6 |
| `background.surface` | `black_01` (white) |
| `background.tonal` | `pink_09` |
| `background.pressed` | #DFDFE6 |
| `background.selected` | `pink_10` |
| `background.disable` | #EBEBF2 |
| `text.default` | `black_17` (#303233) |
| `text.secondary` | `black_15` (#484848) |
| `text.hint` | `black_12` (#727272) |
| `text.disable` | `black_08` (#C6C6C6) |
| `border.default` | `black_04` (#E8E8E8) |
| `border.disable` | `black_02` (#F9F9F9) |
| `success` | `green_03` / `green_07` / `green_08` |
| `warning` | `orange_03` / `orange_07` / `orange_08` |
| `error` | `red_03` / `red_07` / `red_08` |
| `highlight` | `mint_03` / `mint_07` / `mint_08` |
| `interactive` | `blue_03` / `blue_07` / `blue_08` |

---

## Dark Theme (darkTheme)

| Path | Value |
|------|-------|
| `primary` | `pink_04` |
| `secondary` | `pink_08` |
| `gradient` | #FDCADE |
| `background.default` | #121212 |
| `background.surface` | #1E1E1E |
| `background.tonal` | `pink_10` |
| `background.pressed` | #1A1A1A |
| `background.selected` | `pink_11` |
| `background.disable` | #303030 |
| `text.default` | White |
| `text.secondary` | #B0B0B0 |
| `text.hint` | #727272 |
| `text.disable` | #505050 |
| `border.default` | #2A2A2A |
| `border.disable` | #242424 |

Success, warning, error, highlight, and interactive colors are the same in both themes.

---

## Compose Theme Data Structures

```kotlin
data class Theme(dark: Boolean, colors: ColorScheme, font: String, assets: ThemeAssets)
data class ColorScheme(primary, secondary, gradient: Color, background: Background, text: TextColors, border: BorderColors, success/warning/error/highlight/interactive: ColorSet)
data class Background(default, surface, tonal, pressed, selected, disable: Color)
data class TextColors(default, secondary, hint, disable: Color)
data class BorderColors(default, disable: Color)
data class ColorSet(primary, secondary, container: Color)
data class ThemeAssets(headerBackground: String?)
```

---

## Best Practice

Always prefer `theme.colors.*` over direct `Colors.*` tokens so the UI automatically adapts to light/dark mode.
