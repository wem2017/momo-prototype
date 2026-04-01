# Collapse

> Expandable/collapsible content section — header + chevron toggle to show/hide content. Progressive disclosure.

**Package:** `@momo-kits/collapse`
**Platform:** RN ✅ | Compose ❌ (build with AnimatedVisibility)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `title` | string | — | required | Header text label |
| `expanded` | boolean | `true` \| `false` | `false` | Controlled expand/collapse state |
| `defaultExpanded` | boolean | `true` \| `false` | `false` | Initial state khi uncontrolled [VERIFY] |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive — header not tappable |
| `showDivider` | boolean | `true` \| `false` | `false` | Show Divider between header and content [VERIFY] |
| `children` | element | — | required | Content to show/hide — any components |
| `onChange` | function | — | — | Callback khi toggle. `"onChange": "setState://expanded"` |

---

## States

| State | Header | Chevron | Content | Interactive |
|-------|--------|---------|---------|-------------|
| **Collapsed** | `Colors.black_17` text | Down (0°) | Hidden | true |
| **Expanded** | `Colors.black_17` text | Up (180°) | Visible | true |
| **Pressed** | Opacity 0.8 | — | — | true |
| **Disabled** | `Colors.black_08` text | `Colors.black_08` | Per current state | false |

Chevron rotates smoothly (180°) on toggle. Content animates with height transition.

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **FAQ / Help** | Q&A sections, supplementary info | Primary content → show directly | FAQ trong Help center |
| **Advanced settings** | Secondary options user rarely needs | Critical settings → show always | Cài đặt nâng cao, tùy chọn bổ sung |
| **Accordion** | Multiple collapse sections, one open at a time | Independent sections | Chi tiết giao dịch, điều khoản |

---

## SSR Pattern

### FAQ Section
```json
{
  "id": "faq_section",
  "type": "section",
  "forEach": "{{data.faqs}}",
  "render": {
    "component": "Collapse",
    "props": {
      "title": "{{item.question}}",
      "expanded": false
    },
    "children": [
      {
        "component": "Text",
        "props": {
          "content": "{{item.answer}}",
          "typography": "body_default_regular"
        }
      }
    ]
  }
}
```

### Transaction Details Accordion
```json
{
  "component": "Collapse",
  "props": {
    "title": "Chi tiết giao dịch",
    "showDivider": true
  },
  "children": [
    {
      "component": "Text",
      "props": {
        "content": "{{data.transactionDetails}}",
        "typography": "body_s_regular"
      }
    }
  ]
}
```

---

## Accessibility

- Header role: button. Announce title + state ("Chi tiết giao dịch, collapsed").
- Content hidden from accessibility tree khi collapsed.
- Full header row is tap target, not just chevron.
- State change announced on toggle.

---

## Usage Guidelines

### Do
- Dùng cho secondary/supplementary content — FAQ, advanced settings, details.
- Clear descriptive title — user knows what content is hidden.
- Start collapsed by default unless content is expected to be read immediately.
- Divider khi content is visually dense.

### Don't
- Không hide primary/critical content trong collapse.
- Không dùng cho navigation → dùng proper nav patterns.
- Không nest collapse deeply (collapse trong collapse) — confusing UX.
- Không dùng khi content chỉ 1-2 lines — show directly instead.
- Không remove chevron icon — user cần visual indicator.
