# Loader

> Loading spinner/dot animation — full-screen loading states và initial data fetches.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ❌ (dùng `CircularProgressIndicator` hoặc Skeleton)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `type` | string | `"spinner"` \| `"dot"` | `"spinner"` | Loader variant [VERIFY] |
| `color` | string | `Colors.*` token | `"Colors.pink_03"` | Loader color [VERIFY] |

---

## Variants

| Variant | Animation | Usage |
|---------|----------|-------|
| **spinner** | Continuous circular rotation | General-purpose loading |
| **dot** | Sequential pulsing/scaling dots | Lighter, playful contexts |

---

## States

| State | Color | Animation | Description |
|-------|-------|----------|-------------|
| **Loading** | `Colors.pink_03` | Active | Continuous animation |

---

## Variant-to-Context Map

| Variant | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **spinner** | Full-screen loading, screen transitions | Inline content loading → dùng Skeleton | App initialization, screen data fetch |
| **dot** | Lighter loading contexts | Formal/serious screens | Chat typing indicator, playful loading |

---

## SSR Pattern

### Full-screen Loading
```json
{
  "id": "loading_screen",
  "type": "center",
  "children": [
    {
      "component": "Loader",
      "props": {
        "type": "spinner"
      }
    }
  ]
}
```

---

## Accessibility

- Loader announce "Đang tải" cho screen readers.
- Khi loading complete → loaded content nhận focus.
- Loader không focusable hoặc interactive.

---

## Usage Guidelines

### Do
- Dùng cho full-screen loading states.
- Dùng cho initial data fetches khi no layout structure known.
- Center loader trong available space.
- Spinner cho general-purpose, dot cho lighter contexts.

### Don't
- Không dùng cho inline content loading → dùng **Skeleton**.
- Không dùng trong button → dùng **Button** loading prop.
- Không show Loader cho near-instant operations.
- Không dùng trên Compose → dùng native `CircularProgressIndicator`.
