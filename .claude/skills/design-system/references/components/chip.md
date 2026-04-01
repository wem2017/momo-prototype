# Chip

> Interactive filter/selection pill — toggle giữa selected/unselected khi tap.

**Package:** `@momo-kits/chip`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `label` | string | — | required | Display text. 1-3 words |
| `size` | string | `"small"` \| `"large"` | `"small"` | Chip size |
| `selected` | boolean | `true` \| `false` | `false` | Selection state |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive state |
| `leftIcon` | string | icon name | — | Optional icon trước label |
| `rightIcon` | string | icon name \| `"close"` | — | Optional icon sau label. `"close"` cho removable chip |
| `onPress` | function | — | — | Tap handler — toggle selected state |
| `onPressRightIcon` | function | — | — | Right icon tap — remove/deselect [VERIFY] |

> **Lưu ý cho ui-composer:** Chip dùng package riêng `@momo-kits/chip`, không nằm trong `@momo-kits/foundation`.

---

## Variants

| Variant | Background | Text Color | Icon Color | Usage |
|---------|-----------|-----------|-----------|-------|
| **Unselected** | `Colors.black_04` | `Colors.black_17` | `Colors.black_12` | Default resting state |
| **Selected** | `Colors.pink_09` | `Colors.pink_03` | `Colors.pink_03` | Active / chosen state |

---

## States

| State | Background | Text Color | Icon Color | Opacity | Interactive |
|-------|-----------|-----------|-----------|---------|-------------|
| **Unselected** | `Colors.black_04` | `Colors.black_17` | `Colors.black_12` | 1 | true |
| **Selected** | `Colors.pink_09` | `Colors.pink_03` | `Colors.pink_03` | 1 | true |
| **Pressed** | same as current | same as current | same as current | 0.8 | true |
| **Disabled** | `Colors.black_04` | `Colors.black_08` | `Colors.black_08` | 0.5 | false |

Transition giữa unselected ↔ selected là immediate (no animation).

---

## Variant-to-Context Map

| Variant | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| Unselected (default) | Chip chưa được chọn trong filter group | Chỉ có 1 chip đơn lẻ — không có group | Filter dịch vụ trên màn hình tìm kiếm (Tất cả / Chuyển tiền / Thanh toán) |
| Selected | User đã chọn — active filter đang apply | Không có toggle behavior — dùng Tag | Filter "Chuyển tiền" đang active trong lịch sử GD |
| Removable (rightIcon=close) | User remove selection bằng tap X | Label dài >3 từ — chip bị stretch | Địa chỉ đã chọn trong form giao hàng, tags đã pick |

---

## SSR Pattern

### Horizontal Filter Bar
```json
{
  "id": "filter_chips",
  "type": "row",
  "scrollable": true,
  "spacing": "Spacing.XS",
  "forEach": "{{data.filterOptions}}",
  "render": {
    "component": "Chip",
    "props": {
      "label": "{{item.label}}",
      "size": "small",
      "selected": "{{state.selectedFilter == $index}}"
    },
    "onPress": "setState://selectedFilter=$index"
  }
}
```

### Multi-select Wrap Group
```json
{
  "id": "category_chips",
  "type": "wrap",
  "forEach": "{{data.categories}}",
  "render": {
    "component": "Chip",
    "props": {
      "label": "{{item.name}}",
      "size": "large",
      "selected": "{{item.selected}}",
      "leftIcon": "{{item.icon}}"
    },
    "onPress": "setState://toggleCategory={{item.id}}"
  }
}
```

### Removable Tags
```json
{
  "id": "selected_tags",
  "type": "wrap",
  "forEach": "{{state.selectedItems}}",
  "render": {
    "component": "Chip",
    "props": {
      "label": "{{item.name}}",
      "size": "small",
      "selected": true,
      "rightIcon": "close"
    },
    "onPressRightIcon": "setState://removeItem={{item.id}}"
  }
}
```

---

## Accessibility

- Mỗi chip cần accessible label gồm: text + current state (selected/not).
- Role: `"button"` hoặc `"toggle"` — screen readers phải announce interactive nature.
- Khi selected state thay đổi: announce "Selected" hoặc "Deselected".
- Trong chip group: navigable as a group với clear boundaries.

---

## Usage Guidelines

### Do
- Dùng Chip để filter content theo category, type, attribute.
- Dùng cho multi-select — user pick từ set of options.
- Dùng cho removable selections (dismiss bằng X icon).
- Giữ label ngắn — 1-3 words.
- Group related chips trong horizontal scrollable row hoặc wrapping layout.

### Don't
- Không dùng cho static status display — dùng **Tag**.
- Không dùng cho navigation actions — dùng **Button**.
- Không dùng cho notification counts — dùng **Badge**.
- Không nest interactive elements bên trong Chip.
- Không dùng text label dài gây stretch chip.
