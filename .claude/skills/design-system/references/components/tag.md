# Tag

> Label indicator — classify content theo status, category, hoặc type. Non-interactive.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `label` | string | — | required | Tag text. 1-2 words max |
| `variant` | string | `"default"` \| `"orange"` \| `"green"` \| `"red"` \| `"blue"` \| `"grey"` | `"default"` | Color variant [VERIFY] |
| `size` | string | `"large"` \| `"medium"` | `"medium"` | Tag size [VERIFY] |

---

## Variants

| Variant | Background | Text Color | Semantic |
|---------|-----------|-----------|----------|
| **default** | `Colors.black_04` | `Colors.black_17` | Neutral |
| **orange** | `Colors.orange_08` | `Colors.orange_03` | Warning, pending |
| **green** | `Colors.green_08` | `Colors.green_03` | Success, completed |
| **red** | `Colors.red_08` | `Colors.red_03` | Error, failed |
| **blue** | `Colors.blue_08` | `Colors.blue_03` | Informational |
| **grey** | `Colors.black_04` | `Colors.black_12` | Inactive, expired |

---

## States

| State | Appearance | Description |
|-------|-----------|-------------|
| **Default** | Static label với assigned color variant | Non-interactive |

Tag là **non-interactive** — chỉ display. Không respond to taps.

---

## Variant-to-Context Map

| Variant | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **green** | Trạng thái thành công/hoàn thành | — | "Thành công" trên giao dịch |
| **red** | Trạng thái lỗi/thất bại | Non-error status | "Thất bại" trên giao dịch |
| **orange** | Trạng thái chờ xử lý/cảnh báo | Already resolved | "Đang xử lý" trên giao dịch |
| **blue** | Thông tin/category | — | "Khuyến mãi" trên deal card |
| **default** | Neutral label không có semantic | Cần semantic color | "Tài chính" category label |
| **grey** | Inactive/expired | Active items | "Hết hạn" trên voucher |

---

## SSR Pattern

### Transaction Status Tag
```json
{
  "component": "Tag",
  "props": {
    "label": "Thành công",
    "variant": "green",
    "size": "medium"
  }
}
```

### Tags in List Item
```json
{
  "id": "transaction_item",
  "type": "row",
  "children": [
    {
      "component": "Text",
      "props": {
        "content": "{{item.title}}",
        "typography": "body_default_regular"
      }
    },
    {
      "component": "Tag",
      "props": {
        "label": "{{item.statusLabel}}",
        "variant": "{{item.statusVariant}}",
        "size": "medium"
      }
    }
  ]
}
```

---

## Accessibility

- Tag text provides accessible label — screen readers đọc content.
- Color alone không phải only indicator of meaning — text content convey status.

---

## Usage Guidelines

### Do
- Dùng Tag cho status ("Thành công", "Đang xử lý", "Thất bại").
- Dùng Tag cho classification ("Tài chính", "Khuyến mãi").
- Chọn color variant match semantic meaning.
- Keep tag text short, scannable.

### Don't
- Không dùng Tag cho interactive filtering — dùng **Chip**.
- Không dùng Tag cho numeric counts — dùng **Badge**.
- Không make Tag tappable — display-only.
- Không dùng long sentences làm tag text.
