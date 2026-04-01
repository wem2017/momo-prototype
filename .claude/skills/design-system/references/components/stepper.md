# Stepper

> Numeric increment/decrement control — minus/plus buttons để adjust value theo discrete steps.

**Package:** `@momo-kits/stepper`
**Platform:** RN ✅ | Compose ❌ (build with Row + Button)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `value` | number | — | `1` | Current numeric value |
| `min` | number | — | `0` | Minimum value. Minus button disabled khi reached |
| `max` | number | — | — | Maximum value. Plus button disabled khi reached |
| `step` | number | — | `1` | Increment/decrement amount per tap [VERIFY] |
| `disabled` | boolean | `true` \| `false` | `false` | Both buttons disabled |
| `onChange` | function | — | — | Callback khi value change. `"onChange": "setState://quantity"` |

---

## States

| State | Minus Button | Plus Button | Value Color | Interactive |
|-------|-------------|-----------|------------|-------------|
| **Default** | `Colors.black_17` icon | `Colors.black_17` icon | `Colors.black_17` | true |
| **At minimum** | `Colors.black_08` (disabled) | `Colors.black_17` | `Colors.black_17` | partial |
| **At maximum** | `Colors.black_17` | `Colors.black_08` (disabled) | `Colors.black_17` | partial |
| **Pressed** | opacity 0.8 | opacity 0.8 | `Colors.black_17` | true |
| **Disabled** | `Colors.black_08` | `Colors.black_08` | `Colors.black_08` | false |

Value updates immediately on tap.

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Quantity picker** | Adjust số lượng items (1-10) | Range lớn (0-1000) → dùng Slider | Số lượng vé, số suất ăn |
| **Count adjustment** | Small numeric adjustments | Freeform numeric input → dùng Input | Số người trong nhóm, số tháng |

---

## SSR Pattern

### Quantity Picker
```json
{
  "id": "quantity_row",
  "type": "row",
  "children": [
    {
      "component": "Text",
      "props": {
        "content": "Số lượng",
        "typography": "body_default_regular"
      }
    },
    {
      "component": "Stepper",
      "props": {
        "value": "{{state.quantity}}",
        "min": 1,
        "max": 10,
        "step": 1
      },
      "onChange": "setState://quantity"
    }
  ]
}
```

---

## Accessibility

- Minus button: accessible label "Giảm".
- Plus button: accessible label "Tăng".
- Current value announce as live region — changes spoken aloud.
- Disabled buttons at boundaries announce disabled.

---

## Usage Guidelines

### Do
- Dùng cho small numeric adjustments (1-10 range).
- Show current value rõ ràng between buttons.
- Disable button khi value reach min/max.
- Reasonable default value — user không cần tap nhiều.

### Don't
- Không dùng cho large ranges → dùng **Slider**.
- Không dùng cho freeform numeric → dùng **Input** numeric keyboard.
- Không hide value display.
- Không dùng cho non-numeric → dùng **Chip** / **Radio**.
