# Stepper

## React Native

```tsx
import { Stepper } from '@momo-kits/stepper';

const stepperRef = useRef<StepperRef>(null);

<Stepper
  ref={stepperRef}
  value={quantity}
  defaultValue={1}
  min={1}
  max={99}
  step={1}
  size="large"
  disabled={false}
  editable={false}
  onValueChange={setQuantity}
/>

// Ref methods
stepperRef.current?.setStepValue(5);
```

Package: `@momo-kits/stepper`

## Compose

```kotlin
import vn.momo.kits.components.Stepper
import vn.momo.kits.components.StepperSize

Stepper(
    defaultValue = 0,            // clamped to min..max
    min = 0,
    max = 100,
    step = 1,
    disabled = false,            // Boolean | BooleanArray
    size = StepperSize.LARGE,    // LARGE | SMALL
    editable = false,            // allow direct keyboard input
    onValueChange = { newValue -> },
)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Per-button disable | Not available | `BooleanArray([minus, plus])` |
| Auto-disable at bounds | Yes | Yes |
| Editable number input | `editable` prop | `editable` param |
| Size | `string` | `StepperSize` enum |
