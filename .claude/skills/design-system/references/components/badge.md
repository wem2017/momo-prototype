# Badge

> Numeric or dot indicator — signal unread counts, notifications, hoặc status trên parent element.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `type` | string | `"badge"` \| `"badgeDot"` \| `"badgeRibbon"` | `"badge"` | Badge variant [VERIFY] |
| `value` | string/number | — | — | Badge content. Number hoặc text ("Mới"). "99+" for overflow |
| `size` | string | `"small"` \| `"large"` | `"small"` | Size cho BadgeDot variant [VERIFY] |
| `backgroundColor` | string | `Colors.*` token | `"Colors.red_03"` | Badge background color [VERIFY] |
| `visible` | boolean | `true` \| `false` | `true` | Show/hide badge. Count = 0 → auto hide [VERIFY] |

---

## Variants

| Variant | Description | Content | Color |
|---------|-----------|---------|-------|
| **badge** | Capsule với numeric/text value | Number hoặc short text ("99+", "Mới") | `Colors.red_03` bg, `Colors.white` text |
| **badgeDot** | Simple circle, no text | — | `Colors.red_03` |
| **badgeRibbon** | Ribbon-style label trên card/image edge | Short text | `Colors.red_03` bg, `Colors.white` text |

---

## States

| State | Appearance | Description |
|-------|-----------|-------------|
| **Visible** | Badge displayed | Count > 0 hoặc status active |
| **Hidden** | Badge removed entirely | Count = 0 → auto hide. Không show "0" |

Badge là non-interactive — chỉ display indicator.

---

## Variant-to-Context Map

| Variant | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **badge** (numeric) | Unread message/notification count | Count = 0 → hide | Chat tab badge "3", Notification bell "12" |
| **badgeDot** | Signal new/unread status without count | Cần show số cụ thể → dùng badge | Profile tab có update mới, Setting có item mới |
| **badgeRibbon** | Promotional label trên card/image | Trong list item đơn giản → dùng Tag | "Giảm 50%" ribbon trên deal card |

---

## SSR Pattern

### Badge on Tab Icon
```json
{
  "icon": "chat",
  "label": "Chat",
  "screen": "Chat",
  "badge": "numericBadge",
  "badgeValue": 3
}
```

### Badge Dot on Avatar
```json
{
  "id": "user_avatar",
  "type": "stack",
  "children": [
    {
      "component": "Avatar",
      "props": {
        "source": "{{data.avatar}}",
        "size": "medium"
      }
    },
    {
      "component": "Badge",
      "props": {
        "type": "badgeDot",
        "size": "small"
      }
    }
  ]
}
```

### Ribbon on Card
```json
{
  "component": "Badge",
  "props": {
    "type": "badgeRibbon",
    "value": "Giảm 50%",
    "backgroundColor": "Colors.red_03"
  }
}
```

---

## Accessibility

- Badge value announce as part of parent element: "Chat, 3 thông báo mới".
- BadgeDot: convey "mới" hoặc "unread" status to screen readers.
- Không rely solely on badge color để convey meaning.

---

## Usage Guidelines

### Do
- Dùng Badge cho unread message/notification counts.
- Dùng BadgeDot cho new/unread status without specific count.
- Dùng BadgeRibbon cho promotional labels trên cards.
- Hide badge khi count = 0.
- Keep badge text short.

### Don't
- Không dùng Badge cho categorization — dùng **Tag**.
- Không dùng Badge cho status text ("Active", "Pending") — dùng **Tag**.
- Không display large strings trong Badge.
- Không đặt multiple badges trên cùng element.
