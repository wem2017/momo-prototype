# Typography Reference

## React Native

```tsx
import { Text } from '@momo-kits/foundation';

<Text typography="body_default_regular">Hello</Text>
```

Pattern: `{category}_{size}_{weight}`

### Full Scale (verified against source)

| Style | Size | Weight |
|-------|------|--------|
| `headline_l_bold` | 28px / 40px | 700 |
| `headline_default_bold` | 24px / 34px | 700 |
| `header_m_bold` | 18px / 26px | 700 |
| `header_default_bold` | 16px / 22px | 700 |
| `header_s_semibold` | 14px / 20px | 600 |
| `header_xs_semibold` | 12px / 18px | 600 |
| `body_default_regular` | 14px / 20px | 400 |
| `body_default_regularstrikethrought` | 14px / 20px | 400 + line-through |
| `description_default_regular` | 12px / 18px | 400 |
| `description_default_regularstrikethrought` | 12px / 18px | 400 + line-through |
| `description_xs_regular` | 10px / 14px | 400 |
| `description_xs_regularstrikethrought` | 10px / 14px | 400 + line-through |
| `label_default_medium` | 14px / 20px | 500 |
| `label_s_medium` | 12px / 18px | 500 |
| `label_xs_medium` | 10px / 14px | 500 |
| `action_default_bold` | 16px / 22px | 700 |
| `action_s_bold` | 14px / 20px | 700 |
| `action_xs_bold` | 12px / 18px | 700 |
| `action_xxs_bold` | 10px / 14px | 700 |

> **Note:** Do NOT use non-existent styles like `headline_l_semibold`, `body_l_regular`, `caption_*`, `label_l_*`, `body_default_regularStrikethrough` (wrong casing) — they are not defined.

### Text Props

```tsx
<Text
  typography="body_default_regular"  // REQUIRED
  color={Colors.black_17}           // text color
  fontFamily="SFProText"            // 'SFProText' | 'AlegreyaSans' | 'BarlowCondensed' | 'MoMoSignature' | 'MoMoTrustDisplay'
  numberOfLines={2}                 // line clamp
  style={textStyle}                 // standard RN text style
/>
```

---

## Compose

```kotlin
import vn.momo.kits.components.Text
import vn.momo.kits.const.Typography

Text(text = "Hello", style = Typography.bodyDefaultRegular)
```

### Full Scale

| Style | Size | Weight |
|-------|------|--------|
| `headlineDefaultBold` | 24sp | Bold |
| `headerMBold` | 18sp | Bold |
| `headerDefaultBold` | 16sp | Bold |
| `headerSSemibold` | 14sp | SemiBold |
| `headerXsSemibold` | 12sp | SemiBold |
| `bodyDefaultRegular` | 14sp | Normal |
| `bodyDefaultRegularStrikethrough` | 14sp | Normal + line-through |
| `descriptionDefaultRegular` | 12sp | Normal |
| `descriptionDefaultRegularStrikethrough` | 12sp | Normal + line-through |
| `descriptionXsRegular` | 10sp | Normal |
| `descriptionXsRegularStrikethrough` | 10sp | Normal + line-through |
| `labelDefaultMedium` | 14sp | Medium |
| `labelSMedium` | 12sp | Medium |
| `labelXsMedium` | 10sp | Medium |
| `actionDefaultBold` | 16sp | Bold |
| `actionSBold` | 14sp | Bold |
| `actionXsBold` | 12sp | Bold |
| `actionXxsBold` | 10sp | Bold |

### Text Props

```kotlin
Text(
    text = "Hello",                          // String or AnnotatedString
    style = Typography.bodyDefaultRegular,   // TextStyle (default)
    color = theme.colors.text.default,       // Color? (null = theme default)
    textAlign = TextAlign.Start,
    maxLines = Int.MAX_VALUE,
    overflow = TextOverflow.Clip,
    textDecoration = null,                   // TextDecoration?
    fontFamily = null,                       // "SFProText" | "MoMoSignature" | "MoMoTrustDisplay"
    modifier = Modifier,
    minLines = 1,
    letterSpacing = TextUnit.Unspecified,
    softWrap = true,
    accessibilityId = null,                  // String? for automation
)
```

Font scaling is automatic via `scaleSize()`.
