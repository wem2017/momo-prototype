# Icon

> Vector icon component — render icons từ design system icon set cho actions, navigation, và visual cues.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `name` | string | icon name | required | Icon identifier từ icon set [VERIFY] |
| `size` | string | `"inline"` \| `"default"` \| `"standard"` \| `"featured"` \| `"hero"` | `"default"` | Icon size [VERIFY] |
| `color` | string | `Colors.*` token | `"Colors.black_17"` | Icon color. Có thể inherit từ parent [VERIFY] |

---

## Variants

| Size | Dimension | Usage |
|------|-----------|-------|
| **inline** | 16×16pt | Inline with text, small indicators |
| **default** | 20×20pt | Default cho most UI contexts |
| **standard** | 24×24pt | Navigation bars, action buttons, list items |
| **featured** | 32×32pt | Emphasized icons, feature highlights |
| **hero** | 48×48pt | Empty states, onboarding, large call-outs |

### Color Context

| Context | Color Token |
|---------|-----------|
| Primary content | `Colors.black_17` |
| Secondary | `Colors.black_15` |
| Hint/placeholder | `Colors.black_12` |
| Disabled | `Colors.black_08` |
| Accent/interactive | `Colors.pink_03` |
| Error | `Colors.red_03` |
| On dark background | `Colors.white` |

---

## States

| State | Color | Description |
|-------|-------|-------------|
| **Default** | per `color` prop | Normal display |
| **Disabled** | `Colors.black_08` | Non-interactive context |

Icon là static display. States chỉ ảnh hưởng color.

---

## Variant-to-Context Map

| Size | Color | Khi nào dùng | Ví dụ trong MoMo |
|------|-------|-------------|-------------------|
| `standard` | `Colors.black_17` | Navigation bar, toolbar icons | Back arrow, search icon trong TopNav |
| `inline` | `Colors.black_12` | Inline with text | Icon trước hint text |
| `featured` | `Colors.pink_03` | Feature highlights | Service icons trên Home |
| `hero` | `Colors.black_12` | Empty state illustrations | Empty transaction list icon |

---

## SSR Pattern

### Icon in Navigation Action
```json
{
  "component": "Icon",
  "props": {
    "name": "navigation_search",
    "size": "standard",
    "color": "Colors.black_17"
  }
}
```

### Icon Inline with Text
```json
{
  "id": "info_row",
  "type": "row",
  "children": [
    {
      "component": "Icon",
      "props": {
        "name": "info_circle",
        "size": "inline",
        "color": "Colors.blue_03"
      }
    },
    {
      "component": "Text",
      "props": {
        "content": "Phí giao dịch miễn phí",
        "typography": "caption_default_regular",
        "color": "Colors.blue_03"
      }
    }
  ]
}
```

---

## Accessibility

- Interactive icons: PHẢI có text accessible label. Icon-only button → provide label.
- Decorative icons (next to text label): ẩn khỏi screen readers.
- Không rely solely on icon color để convey state — pair với indicators.

---

## Usage Guidelines

### Do
- Dùng predefined sizes consistently.
- Dùng `Colors.*` tokens cho tất cả icon colors.
- Provide accessible labels cho tất cả interactive icons.
- `standard` (24pt) cho navigation/toolbar. `inline` (16pt) cho text.

### Don't
- Không dùng icon là sole means of communication without accessible label.
- Không scale icons to arbitrary sizes giữa predefined steps.
- Không dùng raw hex colors — luôn reference design tokens.
- Không dùng overly detailed graphics làm icons.
