# TabView

> Horizontal tab bar — switch between content panels. Categorized content within single screen.

**Package:** `@momo-kits/tab-view`
**Platform:** RN ✅ | Compose ❌ (use TabRow + HorizontalPager)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Variant Axes

| Axis | Options | Default |
|------|---------|---------|
| **Layout** | `fixed` · `scrollable` | `fixed` (≤4 tabs), `scrollable` (>4 tabs) |

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `tabs` | array | `[{ label, key }]` | required | Tab definitions |
| `activeKey` | string | — | first tab's key | Currently active tab key |
| `layout` | string | `"fixed"` \| `"scrollable"` | auto per tab count | Fixed: equal width. Scrollable: intrinsic width, horizontal scroll [VERIFY] |
| `swipeable` | boolean | `true` \| `false` | `true` | Allow swipe gesture to switch content panels [VERIFY] |
| `onChange` | function | — | — | Callback khi tab changes. `"onChange": "setState://activeTab"` |

### Tab Object

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `label` | string | yes | Tab text label (1-2 words) |
| `key` | string | yes | Unique identifier for tab |
| `badge` | number | no | Optional badge count on tab [VERIFY] |

---

## States

| State | Text Color | Indicator | Interactive |
|-------|-----------|-----------|-------------|
| **Active** | `Colors.pink_03` | 2dp pink underline | true |
| **Inactive** | `Colors.black_12` | None | true |
| **Pressed** | Opacity 0.8 | — | true |

Indicator slides smoothly between tabs on switch. Content panels transition via horizontal swipe or tap.

---

## Variant-to-Context Map

| Layout | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|--------|-------------|-----------|-------------------|
| **fixed** | ≤4 tabs, equal importance | >4 tabs → cramped | "Tất cả" / "Đã gửi" / "Đã nhận" |
| **scrollable** | >4 tabs, variable label lengths | ≤4 tabs → use fixed | Category filters, nhiều loại giao dịch |

---

## SSR Pattern

### Transaction History Tabs
```json
{
  "component": "TabView",
  "props": {
    "tabs": [
      { "label": "Tất cả", "key": "all" },
      { "label": "Chuyển tiền", "key": "transfer" },
      { "label": "Thanh toán", "key": "payment" },
      { "label": "Nhận tiền", "key": "receive" }
    ],
    "activeKey": "{{state.activeTab}}",
    "layout": "fixed"
  },
  "onChange": "setState://activeTab"
}
```

### Scrollable Category Tabs
```json
{
  "component": "TabView",
  "props": {
    "tabs": "{{data.categories}}",
    "activeKey": "{{state.selectedCategory}}",
    "layout": "scrollable"
  },
  "onChange": "setState://selectedCategory"
}
```

---

## Accessibility

- Each tab announces: label + position ("Tab 2 trong 4") + state ("đang chọn").
- Content panels navigable by swiping.
- Tab labels descriptive and concise.
- Minimum 44dp touch target height per tab.

---

## Usage Guidelines

### Do
- Dùng cho organizing related content into parallel categories.
- Tab labels short — 1-2 words.
- Default to most relevant tab active on first load.
- Scrollable variant khi >4 tabs.
- Consistent content structure across tab panels.

### Don't
- Không dùng cho sequential steps → dùng **Steps**.
- Không dùng cho app-level navigation → dùng **BottomTab**.
- Không >6-7 tabs even in scrollable mode.
- Không mix icons and text in tab labels unless all tabs have both.
- Không nest TabView trong TabView — confusing navigation.
- Không truncate tab labels → shorten text or switch to scrollable.
