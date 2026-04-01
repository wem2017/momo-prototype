# InputOTP

> Code entry với individual character cells — dùng cho xác thực OTP, mã PIN hiển thị trong MoMo.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `length` | number | `4` \| `5` \| `6` | `6` | Số ô nhập (cells) [VERIFY] |
| `value` | string | — | `""` | Current OTP value |
| `errorMessage` | string | — | — | Error text bên dưới cells |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive state |
| `autoFocus` | boolean | `true` \| `false` | `true` | Auto focus cell đầu tiên khi mount [VERIFY] |
| `onComplete` | function | — | — | Callback khi nhập đủ digits. `"onComplete": "action://verifyOTP"` [VERIFY] |
| `onChange` | function | — | — | Callback mỗi digit thay đổi. `"onChange": "setState://otpValue"` |

> **Khác biệt lớn:** InputOTP KHÔNG dùng floating label, prefix, suffix, hintText, size prop. Anatomy hoàn toàn khác các Input variants khác.

---

## States

| State | Cell Border | Cell Background | Digit Color | Error Color | Interactive |
|-------|------------|----------------|------------|-------------|-------------|
| **Empty** | `Colors.black_04` | `Colors.white` | — | — | true |
| **Focused** | `Colors.blue_03` | `Colors.white` | `Colors.black_17` | — | true |
| **Filled** | `Colors.black_04` | `Colors.white` | `Colors.black_17` | — | true |
| **Error** | `Colors.red_03` | `Colors.white` | `Colors.black_17` | `Colors.red_03` | true |
| **Disabled** | `Colors.black_03` | `Colors.white` | `Colors.black_08` | — | false |

- Error state: TẤT CẢ cells chuyển border sang `Colors.red_03`, không chỉ cell sai.
- Focused cell: chỉ 1 cell có `Colors.blue_03` border tại mỗi thời điểm.
- Auto-advance: nhập 1 digit → focus tự chuyển sang cell tiếp theo.
- Auto-paste: paste SMS OTP → fill tất cả cells cùng lúc.

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **OTP verification** | Xác thực giao dịch qua SMS/email code | Code dài >6 digits — dùng Input standard | OTP xác nhận chuyển tiền, OTP đăng nhập |
| **Confirmation code** | Nhập mã xác nhận từ email/app | Code có chữ cái — InputOTP chỉ numeric | Mã xác nhận từ email MoMo |
| **PIN display** | Nhập PIN hiển thị (không mask) | Cần mask dots → dùng Input standard + secureTextEntry | — |

---

## SSR Pattern

### OTP Verification Screen
```json
{
  "id": "otp_section",
  "type": "section",
  "children": [
    {
      "component": "Text",
      "props": {
        "content": "Nhập mã xác thực",
        "typography": "heading_default_bold"
      }
    },
    {
      "component": "Text",
      "props": {
        "content": "Mã OTP đã gửi đến {{data.maskedPhone}}",
        "typography": "body_default_regular"
      }
    },
    {
      "component": "InputOTP",
      "props": {
        "length": 6,
        "errorMessage": "{{state.otpError}}",
        "autoFocus": true
      },
      "onComplete": "action://verifyOTP",
      "onChange": "setState://otpValue"
    },
    {
      "component": "Text",
      "props": {
        "content": "Gửi lại sau {{state.countdown}}s",
        "typography": "caption_default_regular"
      }
    },
    {
      "component": "Button",
      "props": {
        "title": "Gửi lại mã",
        "type": "textlink",
        "disabled": "{{state.countdown > 0}}"
      },
      "onPress": "action://resendOTP"
    }
  ]
}
```

---

## Accessibility

- Each cell phải có accessible label: "Digit 1 of 6", "Digit 2 of 6", etc.
- Auto-advance phải announce: "Moving to next digit".
- Error announcement: screen reader phải announce error message khi validation fails.
- Keyboard: numeric only.
- Auto-paste: support clipboard paste cho toàn bộ OTP.

---

## Usage Guidelines

### Do
- Dùng `autoFocus` để focus cell đầu tiên ngay khi screen mount.
- Support auto-paste từ SMS — user không cần nhập từng digit.
- Show countdown timer cho resend OTP.
- Clear error state khi user bắt đầu nhập lại.
- Dùng `length=6` cho OTP standard, `length=4` cho short codes.

### Don't
- Không dùng InputOTP cho password — dùng **Input** standard + secureTextEntry.
- Không dùng cho text codes có chữ cái — InputOTP chỉ numeric.
- Không disable auto-paste — đây là UX critical cho OTP flow.
- Không show timer quá 5 phút — user sẽ bỏ flow.
