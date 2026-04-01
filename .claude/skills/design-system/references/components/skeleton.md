# Skeleton

> Loading placeholder mimics content shape — shimmer animation khi data đang fetch.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `width` | number/string | dp \| `"100%"` | `"100%"` | Skeleton width [VERIFY] |
| `height` | number | dp | required | Skeleton height [VERIFY] |
| `borderRadius` | number/string | dp \| `"circle"` | `0` | Corner radius. `"circle"` cho avatar shape [VERIFY] |
| `animated` | boolean | `true` \| `false` | `true` | Enable shimmer animation [VERIFY] |

> **Compose:** Skeletons dùng `BoxWithConstraints` — auto-adapt to parent size.

---

## Variants

Skeleton không có visual variants — shape phụ thuộc content nó replace.

| Content Type | Shape | borderRadius |
|-------------|-------|-------------|
| Text line | Rectangle narrow | small |
| Avatar | Circle | `"circle"` |
| Thumbnail/Image | Rectangle matching aspect ratio | medium |
| Card | Rounded rectangle | card radius |
| Button | Rounded rectangle matching button | pill |

---

## States

| State | Base Color | Highlight Color | Animation |
|-------|-----------|----------------|-----------|
| **Loading** | `Colors.black_03` | `Colors.black_04` | Pulsing shimmer, continuous loop |

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Content loading** | Data đang fetch, layout structure known | Content loads instantly → không cần | Transaction list loading, feed loading |
| **Lazy section** | Section lazy-loaded within screen | Full-screen initial load → dùng Loader | Card section loading trên Home |
| **Image placeholder** | Image đang download | — | Avatar loading, banner loading |

---

## SSR Pattern

### User Card Skeleton
```json
{
  "id": "user_skeleton",
  "type": "row",
  "children": [
    {
      "component": "Skeleton",
      "props": {
        "width": 48,
        "height": 48,
        "borderRadius": "circle"
      }
    },
    {
      "id": "text_skeleton",
      "type": "section",
      "children": [
        {
          "component": "Skeleton",
          "props": {
            "width": "60%",
            "height": 16,
            "borderRadius": 4
          }
        },
        {
          "component": "Skeleton",
          "props": {
            "width": "40%",
            "height": 12,
            "borderRadius": 4
          }
        }
      ]
    }
  ]
}
```

---

## Accessibility

- Skeleton areas announce "Đang tải" cho screen readers.
- Khi content loaded → loaded content nhận focus và announce.
- Skeleton không focusable hoặc interactive.

---

## Usage Guidelines

### Do
- Dùng cho content loading states khi layout structure known.
- Match skeleton shapes to actual content layout.
- Group multiple skeletons cho full content block (avatar circle + text rectangles).

### Don't
- Không dùng cho action loading (button submit) → dùng **Button** loading state.
- Không dùng cho full-screen initial load → dùng **Loader**.
- Không để skeleton visible indefinitely — show error/empty state nếu loading fails.
- Không dùng cho content loads instantly — unnecessary visual noise.
