# SuggestAction

> Tappable suggestion row — title + optional description + chevron. Quick-action entry point.

**Package:** `@momo-kits/suggest-action`
**Platform:** RN ✅ | Compose ❌
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `title` | string | — | required | Primary text — action label |
| `description` | string | — | — | Secondary text below title. Optional [VERIFY] |
| `icon` | string | icon name | — | Leading icon [VERIFY] |
| `showChevron` | boolean | `true` \| `false` | `true` | Show trailing chevron (→) indicator [VERIFY] |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive state |
| `onPress` | function | — | — | Callback khi tap. `"onPress": "navigate://Screen"` hoặc `"onPress": "action://doSomething"` |

---

## States

| State | Appearance | Interactive |
|-------|-----------|-------------|
| **Default** | Full opacity, chevron visible | true |
| **Pressed** | Opacity 0.8 (entire row) | true |
| **Disabled** | Reduced opacity (0.4), no press feedback | false |

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Quick action** | Suggest next action after completing flow | Primary CTA needed → dùng Button | "Xem lịch sử giao dịch" sau khi chuyển tiền |
| **Navigation shortcut** | Link to related screen/feature | Standalone navigation → dùng list item | "Mời bạn bè" suggestion |
| **Contextual suggestion** | AI/system-suggested action based on context | Static menu items | "Thanh toán điện nước" khi đến hạn |

---

## SSR Pattern

### Post-Transaction Suggestions
```json
{
  "id": "suggest_actions",
  "type": "section",
  "children": [
    {
      "component": "SuggestAction",
      "props": {
        "title": "Xem lịch sử giao dịch",
        "icon": "history"
      },
      "onPress": "navigate://TransactionHistory"
    },
    {
      "component": "SuggestAction",
      "props": {
        "title": "Chuyển tiền cho người khác",
        "description": "Gửi tiền nhanh đến số điện thoại"
      },
      "onPress": "navigate://Transfer"
    }
  ]
}
```

---

## Accessibility

- Announce as button: "[title], [description]".
- Chevron is decorative — not announced separately.
- Full row is single tap target.

---

## Usage Guidelines

### Do
- Dùng cho contextual next-step suggestions.
- Keep title actionable — verb-first ("Xem...", "Mời...", "Thanh toán...").
- Description chỉ khi cần clarify action.
- Group 2-3 suggestions together maximum.

### Don't
- Không dùng cho primary actions → dùng **Button**.
- Không dùng cho navigation menus → dùng list với proper list items.
- Không show >3 suggestions — overwhelming.
- Không omit onPress — mỗi SuggestAction phải navigate/action.
