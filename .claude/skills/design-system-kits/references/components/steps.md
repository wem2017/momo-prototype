# Steps

## React Native

```tsx
import { Steps } from '@momo-kits/step';

<Steps
  steps={[
    { title: 'Info' },
    { title: 'Payment', description: 'Add payment method' },
    { title: 'Done', error: false, time: '10:30' },
  ]}
  activeIndex={1}
  horizontal={false}
  size="large"
  useNumber={false}
  align="center"
  customIcon="notifications_check"
  onPress={(item, index) => {}}
  disabled={false}
  accessibilityLabel="steps_vertical"
/>
```

### Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `steps` | `Step[]` | — | Array of step items |
| `activeIndex` | `number` | — | Currently active step index (0-based) |
| `horizontal` | `boolean` | `false` | Horizontal layout (default: vertical) |
| `size` | `'small' \| 'large'` | `'large'` | Step icon size |
| `useNumber` | `boolean` | `false` | Show step numbers instead of checkmarks |
| `align` | `'left' \| 'right' \| 'center' \| 'stretch'` | `'center'` | Step alignment |
| `customIcon` | `string` | — | Custom icon shown for active step |
| `onPress` | `(item, index) => void` | — | Called when a step is tapped |
| `disabled` | `boolean` | `false` | Disable all interactions |
| `accessibilityLabel` | `string` | — | Accessibility label |

### Step

| Prop | Type | Description |
|------|------|-------------|
| `title` | `string` | Step title |
| `description` | `string \| ReactNode` | Optional description text |
| `error` | `boolean` | Mark step as error state |
| `time` | `string` | Optional time label (e.g. "10:30") |

Package: `@momo-kits/step`

## Compose

```kotlin
import vn.momo.kits.components.Steps
import vn.momo.kits.components.StepItem
import vn.momo.kits.components.StepsSize
import vn.momo.kits.components.StepsAlign

Steps(
    steps = listOf(
        StepItem(title = "Info"),
        StepItem(title = "Payment", description = "Add payment method"),
        StepItem(title = "Done", error = false, time = "10:30"),
    ),
    activeIndex = 1,
    horizontal = false,
    size = StepsSize.LARGE,          // SMALL | LARGE
    useNumber = false,
    align = StepsAlign.CENTER,       // LEFT | RIGHT | CENTER | STRETCH
    customIcon = null,
    disabled = false,
    onPress = { stepItem, index -> },
)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Step data | `{ title, description?, error?, time? }` | `StepItem` data class |
| Size | `string` | `StepsSize` enum |
| Align | `string` | `StepsAlign` enum |
| onPress | All steps | Completed steps only |
