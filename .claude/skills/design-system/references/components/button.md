# Button

> Interactive element trigger action — CTA chính và phụ cho mọi screen trong MoMo.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — Figma variant naming typo known ("sencondary")
**Figma node:** [VERIFY]

---

## Variant Axes

| Property | Type | Values | Description |
|----------|------|--------|-------------|
| type | variant | primary · secondary · tonal · outline · danger · textlink · disabled | Visual variant — determines colors and emphasis |
| size | variant | large · medium · small | Button size |
| full | boolean | true · false | Full-width mode |

> **Note:** Figma treats `disabled` as variant trong `type`. Logically nó là state. ui-composer có thể dùng `type: "disabled"` hoặc `disabled: true` [VERIFY].

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `title` | string | — | required | Button label text. Sentence case. Max 20 chars. Start with verb |
| `type` | string | `"primary"` \| `"secondary"` \| `"tonal"` \| `"outline"` \| `"danger"` \| `"textlink"` \| `"disabled"` | `"primary"` | Visual variant |
| `size` | string | `"large"` \| `"medium"` \| `"small"` | `"large"` | Button size |
| `full` | boolean | `true` \| `false` | `false` | Full-width mode — stretches to parent width |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive. Overrides variant colors |
| `loading` | boolean | `true` \| `false` | `false` | Spinner replaces label. Non-interactive during loading |
| `iconLeft` | string | icon name | — | Optional icon before label |
| `iconRight` | string | icon name | — | Optional icon after label |
| `onPress` | function | — | — | Tap handler. `"onPress": "action://submit"` |

---

## Variants

| Variant | Background | Text Color | Border | Emphasis | Usage |
|---------|-----------|-----------|--------|----------|-------|
| **primary** | `Colors.pink_03` | `Colors.white` | none | Highest | Main CTA. Chỉ 1 per screen |
| **secondary** | `Colors.white` | `Colors.pink_03` | `Colors.pink_03` | High | Supporting action. Pair với Primary |
| **tonal** | `Colors.pink_09` | `Colors.pink_03` | none | Medium | Soft emphasis. Grouped actions |
| **outline** | `Colors.white` | `Colors.black_17` | `Colors.black_04` | Low | Neutral, optional actions |
| **danger** | `Colors.red_03` | `Colors.white` | none | Override | Destructive/irreversible only |
| **textlink** | transparent | `Colors.pink_03` | none | Lowest | Inline text action. Skip, Show all |

**Variant hierarchy:** primary > secondary > tonal/outline > textlink. Danger overrides all — dùng độc lập.

---

## States

| State | Background | Text Color | Border | Opacity | Spinner | Interactive |
|-------|-----------|-----------|--------|---------|---------|-------------|
| **Default** | per variant | per variant | per variant | 1 | — | true |
| **Pressed** | per variant | per variant | per variant | 0.8 | — | true |
| **Disabled** | `Colors.black_04` | `Colors.black_08` | none | 1 | — | false |
| **Loading** | per variant | — | per variant | 1 | matches text color | false |

- Pressed: entire button opacity 0.8. Immediate transition.
- Loading: spinner replaces label text. Button maintains exact size. Prevents double-tap.
- Disabled: overrides ALL variant colors → grey.

---

## Variant-to-Context Map

| Variant | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **primary** | Main action trên screen. Max 1 per view | Có 2+ primary actions — hạ bớt xuống secondary | "Chuyển tiền" button trên form transfer |
| **secondary** | Supporting action alongside Primary | Standalone không có Primary kèm — dùng Primary | "Hủy" bên cạnh "Xác nhận" trên popup confirm |
| **tonal** | Grouped actions cần soft emphasis | Action quan trọng cần nổi bật — dùng Primary | "Chọn phương thức" trên màn thanh toán |
| **outline** | Neutral, optional, low-emphasis | Action chính — quá subtle | "Xem chi tiết" trên card giao dịch |
| **danger** | Destructive, irreversible action | Non-destructive actions | "Xóa tài khoản" trên Settings, "Hủy giao dịch" |
| **textlink** | Inline text action, lowest emphasis | Primary action — quá subtle | "Bỏ qua" trên onboarding, "Xem tất cả" trên section |

---

## SSR Pattern

### Fixed Bottom CTA
```json
{
  "id": "bottom_cta",
  "type": "footer",
  "children": [
    {
      "component": "Button",
      "props": {
        "title": "Chuyển tiền",
        "type": "primary",
        "size": "large",
        "full": true,
        "loading": "{{state.isSubmitting}}"
      },
      "onPress": "action://transfer"
    }
  ]
}
```

### Horizontal Pair (Confirm/Cancel)
```json
{
  "id": "action_pair",
  "type": "row",
  "spacing": "Spacing.S",
  "children": [
    {
      "component": "Button",
      "props": {
        "title": "Hủy",
        "type": "secondary",
        "size": "medium"
      },
      "onPress": "action://cancel"
    },
    {
      "component": "Button",
      "props": {
        "title": "Xác nhận",
        "type": "primary",
        "size": "medium"
      },
      "onPress": "action://confirm"
    }
  ]
}
```

### Destructive Confirmation
```json
{
  "id": "destructive_pair",
  "type": "row",
  "spacing": "Spacing.S",
  "children": [
    {
      "component": "Button",
      "props": {
        "title": "Giữ lại",
        "type": "outline",
        "size": "medium"
      },
      "onPress": "action://keep"
    },
    {
      "component": "Button",
      "props": {
        "title": "Xóa tài khoản",
        "type": "danger",
        "size": "medium"
      },
      "onPress": "action://deleteAccount"
    }
  ]
}
```

### Loading Action
```json
{
  "component": "Button",
  "props": {
    "title": "Đang xử lý...",
    "type": "primary",
    "size": "large",
    "full": true,
    "loading": true
  }
}
```

---

## Accessibility

- Screen reader announce: label + role (button) + state (disabled/loading).
- Icon-only buttons: PHẢI có text accessible label.
- Loading state: announce "Đang xử lý" hoặc equivalent.
- Color contrast: tất cả variant text-on-background meet WCAG AA (4.5:1).

---

## Usage Guidelines

### Do
- Dùng Primary cho 1 action quan trọng nhất trên screen.
- Sentence case: "Chuyển tiền" không phải "CHUYỂN TIỀN".
- Label 1-3 words, bắt đầu bằng verb.
- Loading state cho async actions — prevent double-tap.
- Pair Primary + Secondary khi có 2 choices.
- Danger CHỈ cho destructive/irreversible.

### Don't
- Không đặt 2+ Primary buttons trên cùng 1 view area.
- Không mix sizes trong cùng button group.
- Không dùng Danger cho non-destructive actions.
- Không dùng TextLink cho primary actions — quá subtle.
- Không disable button mà không communicate lý do.
- Không mix Primary + Danger trong cùng group.
- Label không quá 20 ký tự, không dùng "!" hay ".".
