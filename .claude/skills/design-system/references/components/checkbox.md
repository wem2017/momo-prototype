# CheckBox

> Multi-selection control — chọn nhiều options hoặc indicate agreement. Supports indeterminate state.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `checked` | boolean | `true` \| `false` | `false` | Checked state |
| `indeterminate` | boolean | `true` \| `false` | `false` | Partial selection state (select-all parent) [VERIFY] |
| `label` | string | — | — | Text label bên phải checkbox |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive state |
| `onChange` | function | — | — | Callback khi toggle. `"onChange": "setState://option"` |

---

## States

| State | Box Appearance | Icon | Label Color | Interactive |
|-------|---------------|------|------------|-------------|
| **Unchecked** | `Colors.black_04` border, no fill | none | `Colors.black_17` | true |
| **Checked** | `Colors.pink_03` fill | white checkmark | `Colors.black_17` | true |
| **Indeterminate** | `Colors.pink_03` fill | white minus | `Colors.black_17` | true |
| **Disabled Unchecked** | `Colors.black_08` border, no fill | none | `Colors.black_08` | false |
| **Disabled Checked** | `Colors.black_08` fill | white checkmark | `Colors.black_08` | false |

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Multi-select** | Chọn nhiều options từ list | Chọn 1 exclusive → dùng Radio | Chọn nhiều dịch vụ, filter multi-category |
| **Agreement** | Consent/terms checkbox | — | "Tôi đồng ý điều khoản" trên form |
| **Select all** | Parent checkbox cho group (indeterminate khi partial) | — | "Chọn tất cả" trên danh sách |

---

## SSR Pattern

### Agreement Checkbox
```json
{
  "component": "CheckBox",
  "props": {
    "checked": "{{state.agreedToTerms}}",
    "label": "Tôi đồng ý với Điều khoản sử dụng"
  },
  "onChange": "setState://agreedToTerms"
}
```

### Multi-select List
```json
{
  "id": "service_options",
  "type": "section",
  "forEach": "{{data.services}}",
  "render": {
    "component": "CheckBox",
    "props": {
      "checked": "{{item.selected}}",
      "label": "{{item.name}}"
    },
    "onChange": "setState://toggleService={{item.id}}"
  }
}
```

---

## Accessibility

- Screen readers announce: label, state (checked/unchecked/indeterminate), role (checkbox).
- Entire row (box + label) tappable.
- State changes announce immediately.

---

## Usage Guidelines

### Do
- Dùng cho selecting multiple options từ list.
- Dùng cho agreement/consent checkboxes.
- Dùng indeterminate cho "select all" parent.
- Luôn provide visible label.

### Don't
- Không dùng cho single on/off toggle → dùng **Switch**.
- Không dùng cho mutually exclusive choices → dùng **Radio**.
- Không dùng cho filter controls trong toolbar → dùng **Chip**.
