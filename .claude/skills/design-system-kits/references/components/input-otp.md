# InputOTP Reference

One-Time Password input with individual character boxes and animated caret.

## React Native

```tsx
import { InputOTP } from '@momo-kits/foundation';

const otpRef = useRef<InputRef>(null);

<InputOTP
  ref={otpRef}
  length={6}
  floatingValue="Enter OTP"
  value={otp}
  onChangeText={value => {
    setOtp(value);
    if (value.length === 6) {
      verifyOTP(value);
    }
  }}
  dataType="number"
  placeholder=""
  errorMessage=""
  hintText="Check your SMS for the code"
/>

// Ref methods
otpRef.current?.focus();
otpRef.current?.blur();
otpRef.current?.setText('123456');
```

### Props

Extends `InputProps` without `size`, `icon`, `iconColor`.

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `length` | `2 \| 4 \| 6 \| 8 \| 10` | `6` | Number of OTP digits |
| `floatingValue` | `string` | **required** | Floating label text |
| `dataType` | `'string' \| 'number'` | `'number'` | Input data type |
| `value` | `string` | — | Controlled value |
| `onChangeText` | `(text: string) => void` | — | Text change handler |
| `placeholder` | `string` | — | Placeholder character |
| `errorMessage` | `string` | — | Error message below input |
| `errorSpacing` | `boolean` | `false` | Reserve space for error |
| `hintText` | `string` | — | Hint text below input |
| `params` | `any` | — | Auto tracking params |
| `onFocus` | `(e: TextInputFocusEvent) => void` | — | Focus handler |
| `onBlur` | `(e: TextInputFocusEvent) => void` | — | Blur handler |
| `style` | `ViewStyle` | — | Container style |

## Compose

```kotlin
import vn.momo.kits.components.InputOTP

InputOTP(
    value = otpValue,
    length = 6,
    floatingValue = "Enter OTP",
    placeholder = "",
    errorMessage = "",
    errorSpacing = false,
    hintText = "Check your SMS for the code",
    dataType = "number",
    onChangeText = { value ->
        otpValue = value
        if (value.length == 6) {
            // handle verification
        }
    },
    onFocus = { /* focus handler */ },
    onBlur = { /* blur handler */ },
    modifier = Modifier,
)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| `ref` for imperative methods (`focus`, `blur`, `setText`) | Supported | Not available |
