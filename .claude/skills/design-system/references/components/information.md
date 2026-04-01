# Information

> Inline alert banner — contextual messages with type-based color coding. Info, warning, error, success.

**Package:** `@momo-kits/information`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `type` | string | `"info"` \| `"warning"` \| `"error"` \| `"success"` | `"info"` | Alert type — determines icon và color scheme |
| `title` | string | — | — | Bold heading text. Optional — omit for simple messages [VERIFY] |
| `description` | string | — | required | Body text content |
| `dismissible` | boolean | `true` \| `false` | `false` | Show close (X) button to dismiss [VERIFY] |
| `icon` | string | icon name | auto per type | Override default icon. Default: info=info-circle, warning=warning-triangle, error=error-circle, success=check-circle [VERIFY] |
| `onDismiss` | function | — | — | Callback khi dismiss. `"onDismiss": "setState://hideInfo=true"` |

---

## Variants

| Type | Background | Icon Color | Border | Default Icon |
|------|-----------|-----------|--------|-------------|
| **info** | `Colors.blue_01` (light blue) | `Colors.blue_03` | `Colors.blue_02` left border [VERIFY] | info-circle |
| **warning** | `Colors.orange_01` (light orange) | `Colors.orange_03` | `Colors.orange_02` left border [VERIFY] | warning-triangle |
| **error** | `Colors.red_01` (light red) | `Colors.red_03` | `Colors.red_02` left border [VERIFY] | error-circle |
| **success** | `Colors.green_01` (light green) | `Colors.green_03` | `Colors.green_02` left border [VERIFY] | check-circle |

Text color: `Colors.black_17` for all types.

---

## States

| State | Appearance | Interactive |
|-------|-----------|-------------|
| **Visible** | Full banner with icon + text | dismissible only |
| **Dismissed** | Hidden (removed from layout) | false |

---

## Variant-to-Context Map

| Type | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|------|-------------|-----------|-------------------|
| **info** | Neutral helpful information, tips | Urgent alerts | Thông tin khuyến mãi, hướng dẫn sử dụng |
| **warning** | Caution — action may have consequences | Critical errors | "Số dư không đủ", cảnh báo phí |
| **error** | Something failed or is invalid | Informational messages | Lỗi giao dịch, validation form errors |
| **success** | Action completed successfully | Persistent status | "Thanh toán thành công", xác nhận đăng ký |

---

## SSR Pattern

### Inline Warning
```json
{
  "component": "Information",
  "props": {
    "type": "warning",
    "title": "Lưu ý",
    "description": "Giao dịch trên 10 triệu cần xác thực bổ sung"
  }
}
```

### Dismissible Info
```json
{
  "component": "Information",
  "props": {
    "type": "info",
    "description": "{{data.promotionMessage}}",
    "dismissible": true
  },
  "onDismiss": "setState://hidePromoInfo=true"
}
```

---

## Accessibility

- Announce type + content: "Warning: Số dư không đủ".
- Dismiss button: accessible label "Đóng thông báo".
- Role: `alert` for error/warning, `status` for info/success.

---

## Usage Guidelines

### Do
- Dùng cho contextual inline messages within page flow.
- Match type to severity — info for tips, error for failures.
- Keep description concise — 1-2 sentences max.
- Place near relevant content (e.g., error near form field).

### Don't
- Không dùng cho transient notifications → dùng **Toast** / **SnackBar**.
- Không dùng cho blocking alerts → dùng **PopupNotify**.
- Không stack multiple Information banners — consolidate messages.
- Không dùng success type for persistent status — it implies transience.
