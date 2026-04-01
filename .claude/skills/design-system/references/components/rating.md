# Rating

> Star-based rating display và input — product reviews, service feedback, quality indicators.

**Package:** `@momo-kits/rating`
**Platform:** RN ✅ | Compose ❌ (build with Row of Icons)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `value` | number | `0` - `5` | `0` | Current rating value. Supports 0.5 increments for display mode |
| `size` | string | `"small"` \| `"medium"` \| `"large"` | `"medium"` | Star size [VERIFY] |
| `interactive` | boolean | `true` \| `false` | `true` | Interactive (input) vs display-only (read-only) [VERIFY] |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive, reduced opacity |
| `onChange` | function | — | — | Callback khi tap star. `"onChange": "setState://rating"` |

---

## Variants

| Mode | Granularity | Half-star | Tappable |
|------|-----------|----------|---------|
| **Interactive** | Whole stars only (1-5) | No | Yes |
| **Display-only** | 0.5 increments (0.0-5.0) | Yes | No |

### Star Colors

| Part | Color |
|------|-------|
| Active (filled) | `Colors.gold_03` |
| Inactive (outline) | `Colors.black_08` |
| Half-star left | `Colors.gold_03` filled |
| Half-star right | `Colors.black_08` outline |

---

## States

| State | Appearance | Interactive |
|-------|-----------|-------------|
| **Empty (0)** | All 5 stars outlined | per mode |
| **Partial (1-4)** | N filled + remaining outlined | per mode |
| **Full (5)** | All 5 stars filled | per mode |
| **Disabled** | All stars reduced opacity (0.4) | false |

---

## Variant-to-Context Map

| Mode | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|------|-------------|-----------|-------------------|
| **Interactive** | User submit feedback/review | Read-only display | Đánh giá merchant sau giao dịch, feedback dịch vụ |
| **Display-only** | Show aggregate/existing rating | User cần input | Rating trung bình merchant, review score |

---

## SSR Pattern

### Interactive Rating in Feedback Form
```json
{
  "component": "Rating",
  "props": {
    "value": "{{state.rating}}",
    "size": "large",
    "interactive": true
  },
  "onChange": "setState://rating"
}
```

### Display Rating with Number
```json
{
  "id": "rating_display",
  "type": "row",
  "children": [
    {
      "component": "Rating",
      "props": {
        "value": "{{data.averageRating}}",
        "size": "small",
        "interactive": false
      }
    },
    {
      "component": "Text",
      "props": {
        "content": "{{data.averageRating}} / 5",
        "typography": "body_s_regular",
        "color": "Colors.black_12"
      }
    }
  ]
}
```

---

## Accessibility

- Announce current rating: "Rating: 4 out of 5 stars".
- Interactive mode: each star individually selectable.
- Display-only: announce as informational text.

---

## Usage Guidelines

### Do
- Dùng cho product/service reviews.
- Display-only cho aggregate ratings. Pair với numeric label khi precision matters.
- Half-star display cho averaged ratings (4.3 → 4.5 stars).
- Consistent sizing within same context.

### Don't
- Không dùng cho binary like/dislike → dùng **Button** / **Switch**.
- Không dùng cho non-quality metrics — stars imply quality.
- Không allow half-star input — interactive chỉ whole stars.
- Không dùng >5 hoặc <5 stars.
- Không change star color from gold.
