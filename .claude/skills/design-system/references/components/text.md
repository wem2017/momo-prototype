# Text

> Base typography component — render mọi nội dung text trong MoMo theo design tokens.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `content` | string | — | required | Text content to display |
| `typography` | string | token name | `"body_default_regular"` | Typography token. Pattern: `{category}_{size}_{weight}` |
| `color` | string | `Colors.*` token | `"Colors.black_17"` | Text color token |
| `numberOfLines` | number | — | — | Max visible lines. Ellipsis khi truncated [VERIFY] |
| `align` | string | `"left"` \| `"center"` \| `"right"` | `"left"` | Text alignment [VERIFY] |
| `fontFamily` | string | `"SFProText"` \| `"AlegreyaSans"` \| `"BarlowCondensed"` | `"SFProText"` | Font family [VERIFY] |

---

## Variants

Text không có visual variants riêng — thay vào đó dùng typography tokens.

### Typography Token Pattern

```
{category}_{size}_{weight}
```

| Category | Sizes | Dùng cho |
|----------|-------|---------|
| `heading` | `l`, `default`, `s` | Section titles, screen headers |
| `body` | `default`, `s` | Body content, descriptions |
| `action` | `default`, `s` | Button labels, interactive text |
| `caption` | `default`, `s` | Small supporting text, timestamps |
| `label` | `default`, `s` | Form labels, metadata |

**Weights:** `regular`, `medium`, `semibold`, `bold`

**Examples:** `body_default_regular`, `heading_l_bold`, `caption_s_medium`, `action_default_bold`

### Color Pairing Rules

| Role | Token | Usage |
|------|-------|-------|
| **Default** | `Colors.black_17` | Primary content, headings, body |
| **Secondary** | `Colors.black_15` | Supporting text |
| **Hint** | `Colors.black_12` | Placeholder, helper text |
| **Disabled** | `Colors.black_08` | Non-interactive text |
| **Accent** | `Colors.pink_03` | Links, highlighted text |
| **Error** | `Colors.red_03` | Error messages |
| **Info** | `Colors.blue_03` | Informational text |

---

## States

| State | Color | Description |
|-------|-------|-------------|
| **Default** | per `color` prop | Normal display |
| **Disabled** | `Colors.black_08` | Non-interactive context |

Text là static, non-interactive component. States chỉ ảnh hưởng color.

---

## Variant-to-Context Map

| Typography | Color | Khi nào dùng | Ví dụ trong MoMo |
|-----------|-------|-------------|-------------------|
| `heading_l_bold` | `Colors.black_17` | Screen heading chính | "Chuyển tiền" title |
| `heading_default_bold` | `Colors.black_17` | Section title | "Người nhận gần đây" section header |
| `body_default_regular` | `Colors.black_17` | Body content | Mô tả giao dịch, hướng dẫn |
| `body_default_regular` | `Colors.black_12` | Helper/hint text | "Nhập số điện thoại người nhận" |
| `caption_s_regular` | `Colors.black_12` | Timestamp, metadata | "Hôm nay, 14:30" |
| `action_default_bold` | `Colors.pink_03` | Tappable text link | "Xem tất cả", "Chi tiết" |
| `body_default_regular` | `Colors.red_03` | Error message | "Số tiền vượt hạn mức" |

---

## SSR Pattern

### Section with Heading + Body
```json
{
  "id": "info_section",
  "type": "section",
  "children": [
    {
      "component": "Text",
      "props": {
        "content": "Thông tin giao dịch",
        "typography": "heading_default_bold"
      }
    },
    {
      "component": "Text",
      "props": {
        "content": "Vui lòng kiểm tra thông tin trước khi xác nhận",
        "typography": "body_default_regular",
        "color": "Colors.black_12"
      }
    }
  ]
}
```

### Truncated List Item Text
```json
{
  "component": "Text",
  "props": {
    "content": "{{item.description}}",
    "typography": "body_s_regular",
    "color": "Colors.black_15",
    "numberOfLines": 2
  }
}
```

---

## Accessibility

- Text content accessible mặc định cho screen readers.
- Decorative text: ẩn khỏi assistive technology.
- Minimum font size: 10sp absolute, prefer 14sp+ cho body.
- Contrast: tất cả text-on-background meet WCAG AA (4.5:1 normal, 3:1 large text).
- Không convey meaning chỉ bằng color — pair với icon hoặc label.

---

## Usage Guidelines

### Do
- Dùng typography tokens consistently — không set font size/weight manually.
- Dùng `Colors.black_17` cho primary readable content.
- Dùng truncation `numberOfLines` khi space constrained.
- Heading tokens cho titles, body tokens cho content.

### Don't
- Không dùng font sizes dưới 10sp.
- Không override line height / letter spacing từ typography tokens.
- Không dùng `Colors.black_08` (Disabled) cho readable content — thiếu contrast.
- Không mix multiple font families trong cùng paragraph.
- Không dùng heading tokens cho body content hoặc ngược lại.
