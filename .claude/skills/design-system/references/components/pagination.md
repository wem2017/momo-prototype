# Pagination

> Page/position indicators — dots, numbers, hoặc scroll bar cho carousels và paged content.

**Package:** `@momo-kits/carousel` (PaginationDot, PaginationScroll) / `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `type` | string | `"dot"` \| `"whiteDot"` \| `"number"` \| `"scroll"` | `"dot"` | Pagination variant [VERIFY] |
| `total` | number | — | required | Total number of pages |
| `current` | number | 0-based index | `0` | Current active page |
| `onChange` | function | — | — | Callback khi page change (for number variant) [VERIFY] |

---

## Variants

| Variant | Active Color | Inactive Color | Content | Usage |
|---------|-------------|---------------|---------|-------|
| **dot** | `Colors.pink_03` | `Colors.black_08` | Circles | Standard carousels, image galleries |
| **whiteDot** | `Colors.white` | `Colors.white` (50% opacity) | Circles | Dark/image backgrounds |
| **number** | `Colors.pink_03` | `Colors.black_12` | Page numbers | When exact page count matters |
| **scroll** | `Colors.pink_03` (indicator) | `Colors.black_08` (track) | Scroll bar | Large page counts |

---

## States

| State | Appearance |
|-------|-----------|
| **Active page** | Highlighted indicator (pink/white, larger dot) |
| **Inactive pages** | Subdued indicator (grey/translucent, smaller) |
| **Transitioning** | Animated interpolation between two page states |

---

## Variant-to-Context Map

| Variant | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **dot** | Standard carousel, ≤7 pages | >7 pages → dùng scroll | Banner carousel trên Home |
| **whiteDot** | Pagination trên dark/image background | Light background → dùng dot | Image gallery, hero banners |
| **number** | Exact page count matters to user | Decorative paging | Onboarding steps |
| **scroll** | Many pages, continuous scroll | ≤5 discrete pages → dùng dot | Feed với lazy loading |

---

## SSR Pattern

### Carousel with Dot Pagination
```json
{
  "id": "banner_carousel",
  "type": "section",
  "children": [
    {
      "component": "Carousel",
      "props": {
        "items": "{{data.banners}}",
        "autoPlay": true
      }
    },
    {
      "component": "Pagination",
      "props": {
        "type": "dot",
        "total": "{{data.banners.length}}",
        "current": "{{state.currentBanner}}"
      }
    }
  ]
}
```

---

## Accessibility

- Announce current page position: "Trang 2 trong 5".
- Dot indicators là decorative khi paired with swipe navigation.
- Number pagination nếu tappable → meet 44dp touch target.

---

## Usage Guidelines

### Do
- PaginationDot cho carousels / image galleries.
- PaginationWhiteDot cho dark backgrounds.
- PaginationNumber khi exact page count matters.
- PaginationScroll cho many pages.
- Center-align below associated content.

### Don't
- Không dùng cho step-by-step progress → dùng **Steps**.
- Không dùng dot cho >7-8 pages → switch to scroll/number.
- Không đặt pagination xa content.
- Không mix variants trong cùng carousel.
