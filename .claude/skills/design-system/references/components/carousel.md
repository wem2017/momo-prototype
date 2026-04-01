# Carousel

> Horizontal scrollable content container — snap-to-item behavior for banners, galleries, onboarding. Pairs with Pagination.

**Package:** `@momo-kits/carousel`
**Platform:** RN ✅ | Compose ❌ (use HorizontalPager)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `items` | array | — | required | Data array for carousel items |
| `renderItem` | function | — | required | Render function per item [VERIFY] |
| `autoPlay` | boolean | `true` \| `false` | `false` | Auto-advance between items |
| `autoPlayInterval` | number | milliseconds | `3000` | Interval between auto-advances [VERIFY] |
| `loop` | boolean | `true` \| `false` | `false` | Seamless wrap from last → first item [VERIFY] |
| `showPagination` | boolean | `true` \| `false` | `true` | Show PaginationDot below carousel [VERIFY] |
| `paginationType` | string | `"dot"` \| `"scroll"` | `"dot"` | Pagination variant (see Pagination component) [VERIFY] |
| `peek` | number | dp | `0` | Amount of adjacent item visible at edges (16-24dp recommended) [VERIFY] |
| `onChange` | function | — | — | Callback khi current item changes. `"onChange": "setState://currentBanner"` |

---

## States

| State | Appearance |
|-------|-----------|
| **Idle** | Current item fully visible, pagination updated |
| **Scrolling** | Items move horizontally, pagination animates |
| **Auto-playing** | Items advance automatically at interval |
| **Paused** | Auto-play paused due to user touch interaction |

Auto-play pauses on user interaction, resumes after release.

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Promotional banners** | Featured content at screen top | Critical content every user must see | Banner khuyến mãi trên Home |
| **Image gallery** | Browse product/service images | Long lists → dùng FlatList | Ảnh merchant, ảnh sản phẩm |
| **Onboarding** | Step-by-step intro slides | Navigation between sections → dùng TabView | Welcome slides, feature intro |

---

## SSR Pattern

### Banner Carousel with Pagination
```json
{
  "id": "banner_section",
  "type": "section",
  "children": [
    {
      "component": "Carousel",
      "props": {
        "items": "{{data.banners}}",
        "autoPlay": true,
        "autoPlayInterval": 5000,
        "loop": true,
        "showPagination": true,
        "paginationType": "dot",
        "peek": 0
      },
      "onChange": "setState://currentBanner"
    }
  ]
}
```

### Image Gallery with Scroll Pagination
```json
{
  "component": "Carousel",
  "props": {
    "items": "{{data.merchantImages}}",
    "autoPlay": false,
    "showPagination": true,
    "paginationType": "scroll",
    "peek": 16
  }
}
```

---

## Accessibility

- Items navigable via swipe gestures on assistive technology.
- Auto-play MUST pause khi screen reader active.
- Each item: descriptive accessible label.
- Announce current position: "Mục 2 trong 5".
- Provide way to pause auto-play without specific gesture.

---

## Usage Guidelines

### Do
- Dùng cho promotional banners, image galleries, onboarding slides.
- Always include pagination indicators.
- Peek adjacent items → signal scrollability.
- Keep 3-8 items — manageable count.
- Auto-play interval ≥3 seconds.

### Don't
- Không dùng cho long lists → dùng FlatList / LazyColumn.
- Không dùng cho section navigation → dùng **TabView** / **BottomTab**.
- Không set autoPlayInterval <3000ms — user cần time to read.
- Không hide pagination khi >1 item.
- Không nest carousels — scroll conflict.
- Không rely on carousel cho critical content — items may be missed.
