# Input

> Single-line text input với floating label — form control cơ bản cho mọi dạng nhập text trong MoMo.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `value` | string | — | `""` | Current input value |
| `floatingValue` | string | — | required | Floating label text. Animates từ placeholder position lên trên khi focus/filled |
| `placeholder` | string | — | — | Hint text khi chưa có value |
| `hintText` | string | — | — | Helper text hiển thị bên dưới container |
| `errorMessage` | string | — | — | Error text bên dưới container. Khi có, replaces hintText |
| `size` | string | `"large"` \| `"medium"` | `"medium"` | Input size. Maps to `InputSize.Large` / `InputSize.Medium` |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive state |
| `editable` | boolean | `true` \| `false` | `true` | `false` = read-only state [VERIFY] |
| `required` | boolean | `true` \| `false` | `false` | Hiển thị required indicator bên cạnh label |
| `prefix` | node | icon \| text | — | Element ở đầu input |
| `trailingIcon` | node | icon | — | Icon ở cuối input |
| `showClearButton` | boolean | `true` \| `false` | `true` | Clear button xuất hiện ở typing/filled/error states [VERIFY] |
| `showInformationIcon` | boolean | `true` \| `false` | `false` | Optional info icon [VERIFY] |
| `image` | node | — | — | Optional image inside input [VERIFY] |
| `onChange` | function | — | — | Callback khi value thay đổi. `"onChange": "setState://fieldName"` |
| `onFocus` | function | — | — | Callback khi input nhận focus |
| `onBlur` | function | — | — | Callback khi input mất focus |
| `onClear` | function | — | — | Callback khi tap clear button [VERIFY] |

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
| **Read-only** | `Colors.black_04` | `Colors.black_17` | `Colors.black_17` | — | hidden | hidden | false |

**Floating label behavior:**
- Default (no value): label inside at placeholder position
- Focus hoặc có value: label animates upward, reduces in size

**Support text priority:** Error > Read-only ("Không thể chỉnh sửa") > Hint

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Text entry** | Nhập text ngắn 1 dòng trong form | Cần nhập số tiền → `InputMoney`, SĐT → `InputPhoneNumber` | Họ tên form KYC, địa chỉ giao hàng |
| **With prefix** | Field có icon/label prefix | Icon không mang ý nghĩa → bỏ prefix | Email field với @ icon |
| **Read-only display** | Show value không cho edit | Cần interactive display → dùng Text component | Thông tin tài khoản đã xác thực |

---

## SSR Pattern

### Standard Form
```json
{
  "id": "form_section",
  "type": "section",
  "children": [
    {
      "component": "Input",
      "props": {
        "floatingValue": "Họ và tên",
        "placeholder": "Nhập họ và tên",
        "size": "medium",
        "required": true
      },
      "onChange": "setState://fullName"
    },
    {
      "component": "Input",
      "props": {
        "floatingValue": "Email",
        "placeholder": "example@email.com",
        "size": "medium"
      },
      "onChange": "setState://email"
    },
    {
      "component": "Button",
      "props": {
        "title": "Tiếp tục",
        "type": "primary",
        "size": "large",
        "full": true,
        "disabled": "{{state.fullName == ''}}"
      },
      "onPress": "action://submitForm"
    }
  ]
}
```

### Input with Validation Error
```json
{
  "component": "Input",
  "props": {
    "floatingValue": "Email",
    "placeholder": "example@email.com",
    "size": "medium",
    "required": true,
    "errorMessage": "{{state.emailError}}",
    "value": "{{state.email}}"
  },
  "onChange": "setState://email"
}
```

---

## Accessibility

- Every input phải có floating label cho screen readers. Không dùng placeholder thay label.
- Error message phải programmatically associated với input.
- Tap label hoặc container area = focus input.
- Read-only: screen reader phải announce non-editable status.

---

## Usage Guidelines

### Do
- Luôn cung cấp floating label — không dùng placeholder thay label.
- Error message inline bên dưới input, không dùng alert/toast.
- Dùng hint text để clarify format ("DD/MM/YYYY").
- Clear error state ngay khi user sửa input.
- Read-only PHẢI có support text.

### Don't
- Không dùng disabled input để hiển thị read-only info — dùng **Text**.
- Không stack nhiều error messages cho 1 input.
- Không ẩn floating label khi input có value.
- Hint text không quá 2 dòng.
- Cần nhập tiền → dùng **InputMoney**, không dùng Input standard.
- Cần nhập SĐT → dùng **InputPhoneNumber**.
- Cần nhập OTP → dùng **InputOTP**.
