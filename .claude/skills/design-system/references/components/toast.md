# Toast

> Transient notification — auto-dismiss message at top of screen. Non-interactive feedback for completed actions.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ❌ (use SnackBar)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `type` | string | `"info"` \| `"warning"` \| `"error"` \| `"success"` | `"info"` | Toast type — determines icon và color |
| `message` | string | — | required | Toast text content |
| `duration` | number | milliseconds | `3000` | Auto-dismiss duration [VERIFY] |
| `position` | string | `"top"` \| `"bottom"` | `"top"` | Screen position [VERIFY] |

---

## Variants

| Type | Icon | Icon Color | Background |
|------|------|-----------|-----------|
| **info** | info-circle | `Colors.blue_03` | `Colors.white` with shadow [VERIFY] |
| **warning** | warning-triangle | `Colors.orange_03` | `Colors.white` with shadow [VERIFY] |
| **error** | error-circle | `Colors.red_03` | `Colors.white` with shadow [VERIFY] |
| **success** | check-circle | `Colors.green_03` | `Colors.white` with shadow [VERIFY] |

Text color: `Colors.black_17` for all types.

---

## States

| State | Appearance |
|-------|-----------|
| **Entering** | Slide in from top with fade animation |
| **Visible** | Full opacity, countdown active |
| **Exiting** | Slide out with fade animation |
| **Dismissed** | Removed from view |

---

## Variant-to-Context Map

| Type | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|------|-------------|-----------|-------------------|
| **success** | Confirm completed action | Action needs follow-up | "Chuyển tiền thành công" |
| **error** | Brief error feedback | Error needs user action → dùng Information | "Không thể kết nối" |
| **warning** | Caution notification | Needs persistent visibility → dùng Information | "Mạng yếu" |
| **info** | Neutral notification | Critical information | "Đã copy mã giới thiệu" |

---

## SSR Pattern

### Success Toast after Action
```json
{
  "id": "submit_action",
  "type": "action",
  "trigger": "onSuccess",
  "toast": {
    "component": "Toast",
    "props": {
      "type": "success",
      "message": "Thanh toán thành công!"
    }
  }
}
```

---

## Accessibility

- Announce toast content as live region — screen reader speaks message immediately.
- Auto-dismiss timing should be sufficient for screen reader to complete announcement (~3s minimum).
- Non-interactive — no tap targets within toast.

---

## Usage Guidelines

### Do
- Dùng cho brief, non-critical feedback messages.
- Auto-dismiss — user không cần interact.
- Keep message short — 1 line.
- Success type cho completed actions.

### Don't
- Không dùng cho errors requiring user action → dùng **Information** hoặc **PopupNotify**.
- Không dùng cho persistent status → dùng **Information**.
- Không include action buttons trong toast → dùng **SnackBar** (Compose).
- Không stack multiple toasts simultaneously.
- Không dùng trên Compose → dùng **SnackBar**.
