# PopupNotify

> Modal dialog — confirmation, alert, decision point. Requires user interaction before proceeding.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅ (via `navigator.showModal`)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `title` | string | — | required | Primary message or question |
| `description` | string | — | — | Supporting detail text |
| `image` | object | `{ uri: string }` | — | Optional illustration/image above title [VERIFY] |
| `primaryButton` | object | `{ label, onPress }` | required | Main action button (filled style) |
| `secondaryButton` | object | `{ label, onPress }` | — | Alternative/cancel button (outlined/text style) |
| `showClose` | boolean | `true` \| `false` | `false` | Show close (X) icon at top-right [VERIFY] |
| `barrierDismissible` | boolean | `true` \| `false` | `false` | Tap overlay to dismiss. Default false — prevents accidental dismissal [VERIFY] |
| `onDismiss` | function | — | — | Callback khi dismissed. `"onDismiss": "action://closePopup"` |

### Button Object

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `label` | string | yes | Button text — use strong verbs ("Xóa", "Xác nhận"), not generic "Yes"/"No" |
| `onPress` | function | yes | Callback. `"onPress": "action://confirm"` |

---

## Variants

| Layout | Khi nào | Description |
|--------|---------|-------------|
| **Row (side-by-side)** | Both labels short, fit in single row | Secondary left, Primary right |
| **Column (stacked)** | Labels long, would truncate in row | Primary top, Secondary below |

Layout auto-detected based on combined button text length. Column is safer default.

---

## States

| State | Appearance |
|-------|-----------|
| **Appearing** | Fade in overlay + scale up container from center |
| **Visible** | Static — user must interact to proceed |
| **Dismissing** | Fade out overlay + container |

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Destructive confirmation** | Confirm delete/cancel actions | Non-destructive feedback → dùng Toast | "Xóa giao dịch này?" |
| **Important alert** | Alert requiring acknowledgment | Non-critical info → dùng Information | "Phiên đăng nhập hết hạn" |
| **Binary decision** | Two-choice decision point | >2 choices → dùng BottomSheet | "Lưu thay đổi?" Lưu / Hủy |

---

## SSR Pattern

### Destructive Confirmation
```json
{
  "component": "PopupNotify",
  "props": {
    "title": "Xóa giao dịch?",
    "description": "Hành động này không thể hoàn tác",
    "primaryButton": {
      "label": "Xóa",
      "onPress": "action://deleteTransaction"
    },
    "secondaryButton": {
      "label": "Hủy",
      "onPress": "action://closePopup"
    }
  }
}
```

### Alert with Image
```json
{
  "component": "PopupNotify",
  "props": {
    "title": "Cập nhật thành công!",
    "description": "Thông tin của bạn đã được cập nhật",
    "image": { "uri": "{{assets.successIllustration}}" },
    "primaryButton": {
      "label": "Đóng",
      "onPress": "action://closePopup"
    }
  }
}
```

---

## Accessibility

- Focus trap: keyboard/screen reader focus trapped within dialog khi open.
- Title announced by screen reader on open.
- ESC / hardware back dismisses dialog.
- Button labels must be clear, descriptive.
- Role: `alertdialog`.

---

## Usage Guidelines

### Do
- Dùng cho destructive action confirmations ("Xóa mục này?").
- Dùng cho important alerts requiring acknowledgment.
- Dùng cho binary decision points ("Lưu / Hủy").
- Strong verb labels on buttons — "Xóa", "Xác nhận", not "Yes"/"No".
- Keep title clear, description concise.

### Don't
- Không dùng cho simple feedback → dùng **Toast** / **SnackBar**.
- Không dùng cho form input → navigate to dedicated screen.
- Không stack multiple PopupNotify dialogs.
- Không >2 action buttons.
- Không dùng cho informational messages without decision → dùng **Information**.
