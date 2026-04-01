# Swipe

> Swipeable list item — horizontal swipe reveals hidden action buttons (delete, edit, archive).

**Package:** `@momo-kits/swipe`
**Platform:** RN ✅ | Compose ❌ (use SwipeToDismissBox)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `actions` | array | `[{ label, icon, color, onPress }]` | required | Right-side action buttons revealed on swipe |
| `leftActions` | array | `[{ label, icon, color, onPress }]` | — | Optional left-side actions (swipe right to reveal) [VERIFY] |
| `disabled` | boolean | `true` \| `false` | `false` | Disable swipe gesture |
| `children` | element | — | required | Content layer — the visible list item |

### Action Object

| Field | Type | Values | Required | Description |
|-------|------|--------|----------|-------------|
| `label` | string | — | yes | Action button text |
| `icon` | string | icon name | no | Action button icon [VERIFY] |
| `color` | string | color token | yes | Action button background color |
| `onPress` | function | — | yes | Callback. `"onPress": "action://deleteItem={{item.id}}"` |

### Common Action Colors

| Action | Background |
|--------|-----------|
| Delete | `Colors.red_03` |
| Archive | `Colors.blue_03` |
| Edit | `Colors.orange_03` |
| Pin | `Colors.pink_03` |

---

## States

| State | Appearance | Interactive |
|-------|-----------|-------------|
| **Resting** | Content fully visible, actions hidden | true (swipeable) |
| **Swiping** | Content moves left, actions partially revealed | true |
| **Actions open** | Content offset, action buttons fully visible | true |
| **Action pressed** | Pressed action button opacity 0.8 | true |
| **Disabled** | No swipe gesture response | false |

Auto-close: opening another Swipe item closes previously open items.

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **List item actions** | Secondary actions on list items (delete, archive) | Primary actions → show visibly | Xóa tin nhắn, archive notification |
| **Quick edit** | Fast inline editing actions | Complex editing → navigate to edit screen | Sửa tên nhóm, pin conversation |

---

## SSR Pattern

### Swipeable Notification List
```json
{
  "id": "notification_list",
  "type": "section",
  "forEach": "{{data.notifications}}",
  "render": {
    "component": "Swipe",
    "props": {
      "actions": [
        {
          "label": "Xóa",
          "color": "Colors.red_03",
          "onPress": "action://deleteNotification={{item.id}}"
        }
      ]
    },
    "children": [
      {
        "component": "Text",
        "props": {
          "content": "{{item.message}}",
          "typography": "body_default_regular"
        }
      }
    ]
  }
}
```

---

## Accessibility

- Swipe actions PHẢI có alternative access (long-press menu hoặc accessible actions list).
- Each action button: clear accessible label ("Xóa mục", "Lưu trữ").
- Screen reader users cannot swipe — provide fallback interaction.
- Khi actions revealed → focusable by assistive technology.

---

## Usage Guidelines

### Do
- Dùng cho secondary actions on list items — delete, archive, edit.
- Limit 2-3 action buttons per item.
- Distinct colors per action for quick identification.
- Destructive action (Delete) rightmost.
- Confirmation dialog cho destructive actions.

### Don't
- Không dùng cho primary actions → make them visible by default.
- Không dùng cho navigation → dùng tap.
- Không >3 action buttons — cramped and hard to target.
- Không rely solely on swipe — always provide accessible fallback.
- Không dùng on items with horizontal scrolling — gesture conflict.
