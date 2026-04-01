# SnackBar

> Transient notification with optional action — bottom-of-screen feedback. Compose equivalent of Toast.

**Package:** built-in Compose (`SnackbarHost`)
**Platform:** RN ❌ (use Toast) | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `message` | string | — | required | Snackbar text content |
| `duration` | number | milliseconds | `3000` | Auto-dismiss duration [VERIFY] |
| `actionLabel` | string | — | — | Optional action button text (e.g., "Hoàn tác"). Omit for no action [VERIFY] |
| `onAction` | function | — | — | Callback khi tap action button. `"onAction": "action://undoDelete"` |
| `type` | string | `"default"` \| `"error"` | `"default"` | Snackbar style variant [VERIFY] |

---

## Variants

| Type | Background | Text Color | Action Color |
|------|-----------|-----------|-------------|
| **default** | `Colors.black_17` (dark) | `Colors.white` | `Colors.pink_03` [VERIFY] |
| **error** | `Colors.red_03` | `Colors.white` | `Colors.white` [VERIFY] |

---

## States

| State | Appearance |
|-------|-----------|
| **Entering** | Slide up from bottom with animation |
| **Visible** | Full opacity at bottom, countdown active |
| **Exiting** | Slide down with fade animation |
| **Dismissed** | Removed from view |

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Action feedback** | Confirm action + offer undo | No undo possible | "Đã xóa. Hoàn tác?" |
| **Brief notification** | Non-critical info (no action needed) | Critical errors → dùng Information | "Đã lưu thay đổi" |
| **Error feedback** | Brief error on Compose | Error needs detail → dùng Information | "Lỗi kết nối" |

---

## SSR Pattern

### SnackBar with Undo Action
```json
{
  "id": "delete_feedback",
  "type": "action",
  "trigger": "onSuccess",
  "snackbar": {
    "component": "SnackBar",
    "props": {
      "message": "Đã xóa mục đã chọn",
      "actionLabel": "Hoàn tác",
      "duration": 5000
    },
    "onAction": "action://undoDelete"
  }
}
```

---

## Accessibility

- Announce snackbar content as live region.
- Action button must meet 44dp touch target.
- Duration sufficient for screen reader announcement + action interaction (~5s when action present).

---

## Usage Guidelines

### Do
- Dùng cho Compose platform transient notifications.
- Include action button khi undo/retry is possible.
- Position at bottom of screen (standard Material placement).
- Extend duration khi có action button (5000ms vs 3000ms).

### Don't
- Không dùng trên RN → dùng **Toast**.
- Không dùng cho persistent messages → dùng **Information**.
- Không dùng cho blocking alerts → dùng **PopupNotify**.
- Không include more than 1 action.
- Không stack multiple snackbars.
