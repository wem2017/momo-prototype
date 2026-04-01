# Radio

> Selection control — chọn exactly 1 option từ mutually exclusive set. Value + groupValue pattern.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `value` | string | — | required | Unique identifier cho radio option này |
| `groupValue` | string | — | — | Currently selected value trong group. Radio selected khi `value == groupValue` |
| `label` | string | — | — | Text label bên phải radio circle |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive state |
| `onChange` | function | — | — | Callback khi selected. `"onChange": "setState://selectedOption"` |

---

## States

| State | Circle Border | Inner Dot | Label Color | Interactive |
|-------|-------------|----------|------------|-------------|
| **Unselected** | `Colors.black_04` | none | `Colors.black_17` | true |
| **Selected** | `Colors.pink_03` | `Colors.pink_03` fill | `Colors.black_17` | true |
| **Disabled Unselected** | `Colors.black_08` | none | `Colors.black_08` | false |
| **Disabled Selected** | `Colors.black_08` | `Colors.black_08` fill | `Colors.black_08` | false |

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Single selection** | Chọn 1 từ 2-5 mutually exclusive options | >5 options → dùng InputDropDown | Chọn phương thức thanh toán, chọn lý do hủy |
| **Default pre-selected** | Recommend 1 option | Không muốn bias user | Chọn gói cước với recommended option |

---

## SSR Pattern

### Radio Group
```json
{
  "id": "payment_method",
  "type": "section",
  "forEach": "{{data.paymentMethods}}",
  "render": {
    "component": "Radio",
    "props": {
      "value": "{{item.id}}",
      "groupValue": "{{state.selectedMethod}}",
      "label": "{{item.name}}"
    },
    "onChange": "setState://selectedMethod={{item.id}}"
  }
}
```

---

## Accessibility

- Screen readers announce: label, state (selected/unselected), role (radio button), position ("1 of 3").
- Entire row (circle + label) tappable.
- Radio groups PHẢI có group label.

---

## Usage Guidelines

### Do
- Dùng cho single selection từ 2-5 mutually exclusive options.
- Luôn display trong group — single radio alone vô nghĩa.
- Pre-select default option khi có recommendation.
- Vertical list layout cho clarity.

### Don't
- Không dùng cho multiple selection → dùng **CheckBox**.
- Không dùng cho >5 options → dùng **InputDropDown**.
- Không dùng cho on/off toggle → dùng **Switch**.
- Radio selections không toggle off — once selected, phải chọn option khác.
