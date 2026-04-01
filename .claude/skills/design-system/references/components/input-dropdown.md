# InputDropDown

> Non-editable input trigger picker/modal — dùng cho selection từ danh sách có sẵn.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `value` | string | — | `""` | Selected value display text |
| `floatingValue` | string | — | required | Floating label text |
| `placeholder` | string | — | — | Hint text khi chưa chọn |
| `hintText` | string | — | — | Helper text bên dưới |
| `errorMessage` | string | — | — | Error text. "Vui lòng chọn" |
| `size` | string | `"large"` \| `"medium"` | `"medium"` | Input size |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive |
| `required` | boolean | `true` \| `false` | `false` | Required indicator |
| `trailingIcon` | node | icon | dropdown arrow | Dropdown arrow icon (built-in) [VERIFY] |
| `onPress` | function | — | — | Callback khi tap — mở picker/modal. `"onPress": "action://openBankPicker"` |

> **CRITICAL:** InputDropDown KHÔNG mở keyboard. Tap = trigger picker/modal/bottom-sheet. KHÔNG dùng cho free-text entry.

---

## States

| State | Border | Text Color | Label Color | Arrow Color | Interactive |
|-------|--------|-----------|------------|-------------|-------------|
| **Default** | `Colors.black_04` | `Colors.black_17` | `Colors.black_17` | `Colors.black_12` | true |
| **Pressed** | `Colors.blue_03` | `Colors.black_17` | `Colors.black_17` | `Colors.black_12` | true |
| **Filled** | `Colors.black_04` | `Colors.black_17` | `Colors.black_17` | `Colors.black_12` | true |
| **Error** | `Colors.red_03` | `Colors.black_17` | `Colors.black_17` | `Colors.black_12` | true |
| **Disabled** | `Colors.black_03` | `Colors.black_08` | `Colors.black_08` | `Colors.black_08` | false |

- Pressed state: chỉ flash khi tap, sau đó open picker → return to filled/default.
- KHÔNG có Focused/Typing state (không editable).

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Bank selection** | Chọn ngân hàng từ danh sách | User cần search trong list dài → combine với search trong picker | Chọn ngân hàng nhận trên form chuyển tiền |
| **Province/City** | Chọn địa điểm | Free-text address → dùng Input standard | Chọn tỉnh/thành trên form KYC |
| **Category** | Chọn loại dịch vụ/category | Ít options (2-3) → dùng Radio group | Chọn loại giao dịch trong báo cáo |
| **Date trigger** | Trigger date picker | — | Chọn ngày sinh (tap → mở DatePicker modal) |

---

## SSR Pattern

### Bank Selection Form
```json
{
  "id": "bank_form",
  "type": "section",
  "children": [
    {
      "component": "InputDropDown",
      "props": {
        "floatingValue": "Ngân hàng",
        "placeholder": "Chọn ngân hàng",
        "size": "medium",
        "required": true,
        "value": "{{state.selectedBankName}}"
      },
      "onPress": "action://openBankPicker"
    },
    {
      "component": "Input",
      "props": {
        "floatingValue": "Số tài khoản",
        "placeholder": "Nhập số tài khoản",
        "size": "medium",
        "required": true
      },
      "onChange": "setState://accountNumber"
    },
    {
      "component": "Button",
      "props": {
        "title": "Tiếp tục",
        "type": "primary",
        "size": "large",
        "full": true
      },
      "onPress": "action://verifyAccount"
    }
  ]
}
```

### Date of Birth Picker
```json
{
  "component": "InputDropDown",
  "props": {
    "floatingValue": "Ngày sinh",
    "placeholder": "DD/MM/YYYY",
    "size": "medium",
    "required": true,
    "value": "{{state.dateOfBirth}}"
  },
  "onPress": "action://openDatePicker"
}
```

---

## Accessibility

- Role: "button" hoặc "combobox" — screen reader announce là selectable, không phải text input.
- Announce: "Ngân hàng, dropdown, double tap to open".
- Khi có selected value: announce value ("Vietcombank selected").
- Picker/modal phải manage focus — return focus to dropdown khi dismiss.

---

## Usage Guidelines

### Do
- Luôn có floating label.
- Show selected value rõ ràng sau khi chọn.
- Dropdown arrow phải luôn visible — visual cue đây là selector.
- Picker có search khi list dài (>10 options).

### Don't
- **KHÔNG BAO GIỜ** dùng cho free-text entry — đây là hard rule.
- Không hide dropdown arrow icon.
- Không dùng khi chỉ có 2-3 options — dùng **Radio** group.
- Không dùng cho toggle on/off — dùng **Switch**.
