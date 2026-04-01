# InputTextArea

> Multiline text input — container grows vertically theo content cho đến max height.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `value` | string | — | `""` | Current input value (multiline) |
| `floatingValue` | string | — | required | Floating label text |
| `placeholder` | string | — | — | Hint text khi chưa có value |
| `hintText` | string | — | — | Helper text bên dưới container |
| `errorMessage` | string | — | — | Error text. Replaces hintText |
| `size` | string | `"large"` \| `"medium"` | `"medium"` | Initial input size |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive state |
| `editable` | boolean | `true` \| `false` | `true` | `false` = read-only [VERIFY] |
| `required` | boolean | `true` \| `false` | `false` | Required indicator |
| `maxLines` | number | — | — | Max dòng trước khi scroll [VERIFY] |
| `maxHeight` | number | — | — | Max chiều cao container [VERIFY] |
| `showClearButton` | boolean | `true` \| `false` | `true` | Clear button [VERIFY] |
| `onChange` | function | — | — | Callback khi value thay đổi |
| `onFocus` | function | — | — | Callback khi focus |
| `onBlur` | function | — | — | Callback khi blur |
| `onClear` | function | — | — | Callback khi clear [VERIFY] |

> **Khác biệt so với Input:** Container height KHÔNG cố định — grows vertically theo content. Keyboard default (multiline enter).

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
| **Long note** | Nhập text dài nhiều dòng | Text ngắn 1 dòng — dùng Input standard | Ghi chú chuyển tiền dài, lý do hoàn tiền |
| **Description** | Mô tả chi tiết | Chỉ cần 1 field ngắn | Mô tả yêu cầu hỗ trợ, feedback |
| **Message** | Tin nhắn dạng freeform | Structured input — dùng form fields riêng | Nhắn tin cho merchant, comment |

---

## SSR Pattern

### Feedback Form
```json
{
  "id": "feedback_section",
  "type": "section",
  "children": [
    {
      "component": "Rating",
      "props": {
        "value": "{{state.rating}}"
      },
      "onChange": "setState://rating"
    },
    {
      "component": "InputTextArea",
      "props": {
        "floatingValue": "Nhận xét của bạn",
        "placeholder": "Chia sẻ trải nghiệm...",
        "size": "medium",
        "maxLines": 5
      },
      "onChange": "setState://feedback"
    },
    {
      "component": "Button",
      "props": {
        "title": "Gửi đánh giá",
        "type": "primary",
        "size": "large",
        "full": true
      },
      "onPress": "action://submitFeedback"
    }
  ]
}
```

### Transfer Note
```json
{
  "component": "InputTextArea",
  "props": {
    "floatingValue": "Lời nhắn",
    "placeholder": "Nhập ghi chú cho người nhận",
    "size": "medium",
    "maxLines": 3
  },
  "onChange": "setState://transferNote"
}
```

---

## Accessibility

- Floating label required cho screen readers.
- Announce multiline capability — "text area, 3 of 5 lines".
- Error message linked.
- Touch target: full container tappable.

---

## Usage Guidelines

### Do
- Set `maxLines` hoặc `maxHeight` để tránh content chiếm toàn bộ screen.
- Dùng `placeholder` để guide content ("Chia sẻ trải nghiệm...").
- Show character count nếu có limit [VERIFY — cần check prop].

### Don't
- Không dùng cho text ngắn 1 dòng — dùng **Input** standard.
- Không set maxLines quá nhỏ (1-2) — vô nghĩa, dùng Input standard.
