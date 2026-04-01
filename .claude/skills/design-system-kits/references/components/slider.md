# Slider

## React Native

```tsx
import { Slider } from '@momo-kits/slider';

<Slider
  min={0}
  max={100}
  step={1}
  low={25}
  high={75}
  minRange={0}
  floatingLabel={false}
  allowLabelOverflow={false}
  disableRange={false}
  disabledHigh={false}
  disabledLow={false}
  onValueChanged={(low, high, byUser) => {}}
  onSliderTouchStart={(low, high) => {}}
  onSliderTouchEnd={(low, high) => {}}
  style={{}}
  testID="price_slider"
  accessibilityLabel="Price range slider"
/>
```

Package: `@momo-kits/slider`

### Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `min` | `number` | — | Minimum value (required) |
| `max` | `number` | — | Maximum value (required) |
| `step` | `number` | — | Step increment (required) |
| `low` | `number` | — | Lower value of selected range |
| `high` | `number` | — | Upper value of selected range |
| `minRange` | `number` | `0` | Minimum gap between low and high |
| `disableRange` | `boolean` | `false` | Disable range mode (single thumb) |
| `disabledHigh` | `boolean` | `false` | Lock the high thumb |
| `disabledLow` | `boolean` | `false` | Lock the low thumb |
| `floatingLabel` | `boolean` | `false` | Show floating value label above thumb |
| `allowLabelOverflow` | `boolean` | `false` | Allow label to extend beyond slider width |
| `onValueChanged` | `(low, high, byUser) => void` | — | Called when value changes; `byUser` indicates user interaction |
| `onSliderTouchStart` | `(low, high) => void` | — | Called on touch start |
| `onSliderTouchEnd` | `(low, high) => void` | — | Called on touch end |

## Compose

```kotlin
import vn.momo.kits.components.Slider

Slider(
    min = 0f,
    max = 100f,
    step = 1f,
    low = 25f,
    high = 75f,
    minRange = 0f,
    disableRange = false,          // single-thumb mode
    floatingLabel = false,        // show value label above thumb
    disabled = false,            // all interaction disabled
    onValueChanged = { low, high, byUser -> },
    onSliderTouchStart = { low, high -> },
    onSliderTouchEnd = { low, high -> },
)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Per-thumb disable | `disabledHigh` / `disabledLow` | `disabled` (global) |
| Gesture library | Built-in | `pointerInput` + `BoxWithConstraints` |
| Animation | Native driver | `animateFloatAsState` + spring |
| Thumb size | Fixed | Fixed (20dp thumb, 4dp track) |
