# Slider

> Range selection control — drag thumb along track to select value or range within min-max bounds.

**Package:** `@momo-kits/slider`
**Platform:** RN ✅ | Compose ❌ (use native Slider)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Variant Axes

| Axis | Options | Default |
|------|---------|---------|
| **Mode** | `single` · `range` | `single` |

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `mode` | string | `"single"` \| `"range"` | `"single"` | Single thumb or dual-thumb range selection |
| `value` | number \| array | number (single) or `[min, max]` (range) | `0` | Current value. Single: number. Range: `[lowValue, highValue]` |
| `min` | number | — | `0` | Minimum bound |
| `max` | number | — | `100` | Maximum bound |
| `step` | number | — | `1` | Value increment. `0` for continuous [VERIFY] |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive state |
| `showLabel` | boolean | `true` \| `false` | `false` | Show value label above thumb [VERIFY] |
| `onChange` | function | — | — | Callback khi value changes. `"onChange": "setState://sliderValue"` |

---

## Variants

| Mode | Thumbs | Track Fill | Usage |
|------|--------|-----------|-------|
| **single** | 1 thumb | Fill from min to thumb | Select single value (volume, brightness) |
| **range** | 2 thumbs | Fill between two thumbs | Select value range (price filter, age range) |

### Track Colors

| Part | Color |
|------|-------|
| Active fill | `Colors.pink_03` |
| Inactive track | `Colors.black_04` |
| Thumb | `Colors.white` with shadow [VERIFY] |

---

## States

| State | Appearance | Interactive |
|-------|-----------|-------------|
| **Default** | Pink fill + grey track, white thumb | true |
| **Dragging** | Thumb enlarged, optional value label shown | true |
| **Disabled** | All elements reduced opacity (0.4) | false |

---

## Variant-to-Context Map

| Mode | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|------|-------------|-----------|-------------------|
| **single** | Adjust single value in continuous range | Discrete options (3-5 choices) → dùng Radio | Volume, brightness, loan amount |
| **range** | Filter by range (min-max) | Single value selection | Lọc giá sản phẩm, khoảng tuổi |

---

## SSR Pattern

### Price Range Filter
```json
{
  "id": "price_filter",
  "type": "section",
  "children": [
    {
      "component": "Text",
      "props": {
        "content": "Khoảng giá",
        "typography": "body_default_bold"
      }
    },
    {
      "component": "Slider",
      "props": {
        "mode": "range",
        "value": [0, 1000000],
        "min": 0,
        "max": 5000000,
        "step": 100000,
        "showLabel": true
      },
      "onChange": "setState://priceRange"
    }
  ]
}
```

### Single Value Slider
```json
{
  "component": "Slider",
  "props": {
    "mode": "single",
    "value": "{{state.amount}}",
    "min": 100000,
    "max": 50000000,
    "step": 100000
  },
  "onChange": "setState://amount"
}
```

---

## Accessibility

- Announce current value: "Slider: 500,000".
- Range mode: announce both values: "Range: 100,000 to 1,000,000".
- Thumb adjustable via accessibility actions (increment/decrement by step).
- Disabled state announced.

---

## Usage Guidelines

### Do
- Dùng cho continuous value selection in a range.
- Range mode cho price/quantity filters.
- Show min/max labels at track ends.
- `showLabel` khi exact value matters to user.
- Reasonable step size — không quá fine-grained.

### Don't
- Không dùng cho small discrete options (1-5) → dùng **Stepper** hoặc **Radio**.
- Không dùng cho exact numeric input → dùng **Input** with numeric keyboard.
- Không set step=0 unless truly continuous control needed.
- Không hide value display khi precision matters — show label or pair with Text.
