# InputMoney

> Currency input với auto-formatting và currency symbol — dùng cho mọi field nhập số tiền trong MoMo.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `value` | string | — | `""` | Current input value (raw number string) |
| `floatingValue` | string | — | required | Floating label text |
| `placeholder` | string | — | — | Hint text khi chưa có value |
| `hintText` | string | — | — | Helper text bên dưới container |
| `errorMessage` | string | — | — | Error text. Replaces hintText |
| `size` | string | `"large"` \| `"medium"` | `"medium"` | Input size |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive state |
| `required` | boolean | `true` \| `false` | `false` | Required indicator |
| `currencySymbol` | string | `"đ"` \| `"VND"` \| custom | `"đ"` | Currency symbol hiển thị [VERIFY] |
| `maxAmount` | number | — | — | Maximum allowed value. Show error khi vượt [VERIFY] |
| `showClearButton` | boolean | `true` \| `false` | `true` | Clear button ở typing/filled/error [VERIFY] |
| `onChange` | function | — | — | Callback khi value thay đổi. `"onChange": "setState://amount"` |
| `onFocus` | function | — | — | Callback khi focus |
| `onBlur` | function | — | — | Callback khi blur |
| `onClear` | function | — | — | Callback khi clear [VERIFY] |

> **Keyboard:** numeric. Auto-format với dấu phân cách hàng nghìn (1.000.000).

---

## States

| State | Border | Text Color | Label Color | Error Color | Cursor | Clear Btn | Interactive |
|-------|--------|-----------|------------|-------------|--------|-----------|-------------|
| **Default** | `Colors.black_04` | `Colors.black_17` | `Colors.black_17` | — | hidden | hidden | true |
| **Focused** | `Colors.blue_03` | `Colors.black_17` | `Colors.black_17` | — | visible | hidden | true |
| **Typing** | `Colors.blue_03` | `Colors.black_17` | `Colors.black_17` | — | visible | visible | true |
| **Filled** | `Colors.black_04` | `Colors.black_17` | `Colors.black_17` | — | hidden | visible | true |
| **Error** | `Colors.red_03` | `Colors.black_17` | `Colors.black_17` | `Colors.red_03` | hidden | visible | true |
| **Disabled** | `Colors.black_03` | `Colors.black_08` | `Colors.black_08` | — | hidden | hidden | false |

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Transfer amount** | Nhập số tiền chuyển khoản | Nhập số lượng item — dùng Input standard | Màn hình chuyển tiền — field "Số tiền" |
| **Top-up** | Nhập số tiền nạp | Amount cố định từ list — dùng Chip group | Nạp tiền điện thoại, nạp ví |
| **Bill payment** | Nhập số tiền thanh toán | Amount auto-fill từ hóa đơn — show read-only | Thanh toán điện, nước, internet |
| **Large prominent** | Amount là focus chính của screen | Trong form nhiều fields — dùng medium | Màn hình nhập tiền chuyển khoản (size large) |

---

## SSR Pattern

### Transfer Amount Screen
```json
{
  "id": "amount_section",
  "type": "section",
  "children": [
    {
      "component": "InputMoney",
      "props": {
        "floatingValue": "Số tiền",
        "placeholder": "Nhập số tiền",
        "size": "large",
        "required": true,
        "errorMessage": "{{state.amountError}}"
      },
      "onChange": "setState://amount"
    },
    {
      "component": "Information",
      "props": {
        "type": "info",
        "content": "Số dư khả dụng: {{data.balance}}"
      }
    },
    {
      "component": "Button",
      "props": {
        "title": "Chuyển tiền",
        "type": "primary",
        "size": "large",
        "full": true
      },
      "onPress": "action://transfer"
    }
  ]
}
```

### Quick Amount Chips + Input
```json
{
  "id": "topup_section",
  "type": "section",
  "children": [
    {
      "id": "preset_amounts",
      "type": "row",
      "scrollable": true,
      "forEach": "{{data.presetAmounts}}",
      "render": {
        "component": "Chip",
        "props": {
          "label": "{{item.label}}",
          "size": "small",
          "selected": "{{state.amount == item.value}}"
        },
        "onPress": "setState://amount={{item.value}}"
      }
    },
    {
      "component": "InputMoney",
      "props": {
        "floatingValue": "Hoặc nhập số tiền khác",
        "size": "medium",
        "value": "{{state.amount}}"
      },
      "onChange": "setState://amount"
    }
  ]
}
```

---

## Accessibility

- Floating label required — screen reader phải announce "Số tiền" label.
- Formatted value phải announce numeric value, không announce separators.
- Error message linked — "Số tiền vượt hạn mức" phải announce khi validation fails.
- Keyboard: numeric only.

---

## Usage Guidelines

### Do
- Dùng `size="large"` khi amount là focus chính của screen.
- Show balance/limit hint via `hintText` hoặc `Information` component bên dưới.
- Auto-format thousands separator khi typing.
- Show currency symbol rõ ràng.

### Don't
- Không dùng cho nhập số lượng đơn vị — dùng **Input** standard.
- Không dùng cho nhập mã code — dùng **InputOTP**.
- Không remove formatting khi typing — user cần visual feedback.
- Không hide currency symbol.
