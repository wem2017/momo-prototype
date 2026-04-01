# Text

## React Native

```tsx
import { Text } from '@momo-kits/foundation';

<Text typography="body_default_regular" color={Colors.black_17} fontFamily="MomoTrustDisplay" maxScaleRate={1.5} style={{}}>Label</Text>
```

### Props

Extends `TextProps` (React Native `Text`). Plus:

| Prop           | Type                   | Default                  | Description            |
| -------------- | ---------------------- | ------------------------ | ---------------------- |
| `typography`   | `Typography`           | `'body_default_regular'` | Typography token       |
| `color`        | `string`               | theme text color         | Text color             |
| `fontFamily`   | `string`               | theme font               | Custom font family     |
| `maxScaleRate` | `number`               | —                        | Max font scale rate    |
| `style`        | `StyleProp<TextStyle>` | —                        | Additional text styles |
| `children`     | `ReactNode`            | —                        | Text content           |

## Compose

```kotlin
import vn.momo.kits.components.Text
import vn.momo.kits.const.Typography

Text(text = "Label", style = Typography.bodyDefaultRegular)
Text(text = "Title", style = Typography.headlineDefaultBold)
```

Signature:

```kotlin
@Composable
fun Text(
    text: String,
    color: Color? = null,
    style: TextStyle = Typography.bodyDefaultRegular,
    modifier: Modifier = Modifier,
    textAlign: TextAlign? = TextAlign.Start,
    maxLines: Int = Int.MAX_VALUE,
    overflow: TextOverflow = TextOverflow.Clip,
    textDecoration: TextDecoration? = null,
    onTextLayout: ((TextLayoutResult) -> Unit)? = null,
    fontFamily: String? = null,
    minLines: Int = 1,
    letterSpacing: TextUnit = TextUnit.Unspecified,
    softWrap: Boolean = true,
    accessibilityId: String? = null,
)
```

> **Note:** NO `token` parameter. Use `style = Typography.xxx` instead.
