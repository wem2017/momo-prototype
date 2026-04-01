# Divider

> Horizontal line separator — phân chia content sections hoặc list items.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** done
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `color` | string | `Colors.*` token | `"Colors.black_04"` | Line color [VERIFY] |

> Divider là component đơn giản nhất — chỉ 1 prop optional. Full width of parent container by default.

---

## States

| State | Color | Description |
|-------|-------|-------------|
| **Default** | `Colors.black_04` | Static, non-interactive |

Divider chỉ có 1 state. Không interactive.

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **List separator** | Phân cách items trong vertical list | Spacing đủ clear → không cần divider | Danh sách giao dịch, contacts list |
| **Section boundary** | Phân chia content sections | Chỉ có 1 section → không cần | Phân chia "Thông tin" và "Số tiền" trong confirm screen |

---

## SSR Pattern

### List with Dividers
```json
{
  "id": "transaction_list",
  "type": "section",
  "forEach": "{{data.transactions}}",
  "render": [
    {
      "component": "ListItem",
      "props": {
        "title": "{{item.title}}",
        "rightText": "{{item.amount}}"
      }
    },
    {
      "component": "Divider",
      "props": {}
    }
  ]
}
```

---

## Accessibility

- Divider là decorative — ẩn khỏi screen readers.
- Không dùng divider để convey meaning — chỉ visual separator.

---

## Usage Guidelines

### Do
- Dùng để separate list items trong vertical list.
- Dùng sparingly — rely on spacing trước.
- Parent layout control spacing above/below divider.

### Don't
- Không dùng cho purely decorative khi spacing đủ.
- Không stack multiple dividers.
- Không đặt divider ở top/bottom container khi không cần separation.
