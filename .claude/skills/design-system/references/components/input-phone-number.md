# InputPhoneNumber

> Phone number input với country code prefix — dùng cho nhập số điện thoại trong MoMo.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `value` | string | — | `""` | Phone number value (without country code) |
| `floatingValue` | string | — | required | Floating label text |
| `placeholder` | string | — | — | Hint text ("0912 345 678") |
| `hintText` | string | — | — | Helper text bên dưới |
| `errorMessage` | string | — | — | Error text. "Số điện thoại không hợp lệ" |
| `size` | string | `"large"` \| `"medium"` | `"medium"` | Input size |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive |
| `required` | boolean | `true` \| `false` | `false` | Required indicator |
| `countryCode` | string | `"+84"` \| `"+1"` \| ... | `"+84"` | Country code prefix [VERIFY] |
| `showClearButton` | boolean | `true` \| `false` | `true` | Clear button [VERIFY] |
| `onChange` | function | — | — | Callback khi value thay đổi |
| `onFocus` | function | — | — | Callback khi focus |
| `onBlur` | function | — | — | Callback khi blur |
| `onClear` | function | — | — | Callback khi clear [VERIFY] |

> **Keyboard:** phone-pad. Country code prefix hiển thị built-in, user chỉ nhập số phone.

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
| **Receiver phone** | Nhập SĐT người nhận | Nhập từ contacts → auto-fill, không cần manual input | Form chuyển tiền — SĐT người nhận |
| **Registration** | Nhập SĐT đăng ký | Đã có SĐT từ SIM → auto-detect [VERIFY] | Đăng ký tài khoản MoMo |
| **Verification** | Nhập SĐT để verify | — | Xác thực số điện thoại, KYC |

---

## SSR Pattern

### Transfer to Phone
```json
{
  "id": "transfer_form",
  "type": "section",
  "children": [
    {
      "component": "InputPhoneNumber",
      "props": {
        "floatingValue": "Số điện thoại người nhận",
        "placeholder": "0912 345 678",
        "countryCode": "+84",
        "size": "medium",
        "required": true,
        "errorMessage": "{{state.phoneError}}"
      },
      "onChange": "setState://receiverPhone"
    },
    {
      "component": "InputMoney",
      "props": {
        "floatingValue": "Số tiền",
        "size": "large",
        "required": true
      },
      "onChange": "setState://amount"
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

### Registration Form
```json
{
  "component": "InputPhoneNumber",
  "props": {
    "floatingValue": "Số điện thoại",
    "placeholder": "Nhập số điện thoại",
    "countryCode": "+84",
    "size": "large",
    "required": true,
    "errorMessage": "{{state.phoneError}}"
  },
  "onChange": "setState://phoneNumber"
}
```

---

## Accessibility

- Floating label required.
- Country code announce: "+84, Vietnam".
- Phone number format announce digits, không announce spaces.
- Error linked.
- Keyboard: phone-pad.

---

## Usage Guidelines

### Do
- Default country code `+84` cho Vietnam market.
- Cho phép chọn country code khác nếu app support international.
- Validate phone format trên blur.
- Auto-format phone number với spaces (0912 345 678).

### Don't
- Không dùng cho nhập số tài khoản ngân hàng — dùng **Input** standard.
- Không dùng cho nhập OTP — dùng **InputOTP**.
- Không require user nhập country code manually — phải có picker.
