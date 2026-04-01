# InputSearch

> Search bar với search icon prefix và cancel action — dùng cho mọi search flow trong MoMo.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `value` | string | — | `""` | Current search query |
| `placeholder` | string | — | `"Tìm kiếm"` | Hint text. Không dùng floating label [VERIFY] |
| `hintText` | string | — | — | Helper text bên dưới (hiếm dùng cho search) |
| `errorMessage` | string | — | — | Error text (hiếm dùng cho search) |
| `size` | string | `"large"` \| `"medium"` | `"medium"` | Search bar size |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive |
| `showClearButton` | boolean | `true` \| `false` | `true` | Clear button khi có value [VERIFY] |
| `onChange` | function | — | — | Callback mỗi keystroke. `"onChange": "setState://searchQuery"` |
| `onFocus` | function | — | — | Callback khi focus — thường trigger search UI |
| `onBlur` | function | — | — | Callback khi blur |
| `onClear` | function | — | — | Callback khi clear [VERIFY] |
| `onCancel` | function | — | — | Callback khi tap Cancel button. Clear value + dismiss focus [VERIFY] |

> **Khác biệt:** InputSearch có search icon prefix built-in và Cancel button appears on focus. Có thể KHÔNG dùng `floatingValue` mà dùng `placeholder` trực tiếp [VERIFY].

---

## States

| State | Border | Text Color | Icon Color | Cancel Btn | Clear Btn | Interactive |
|-------|--------|-----------|-----------|------------|-----------|-------------|
| **Default** | `Colors.black_04` | `Colors.black_17` | `Colors.black_12` | hidden | hidden | true |
| **Focused** | `Colors.blue_03` | `Colors.black_17` | `Colors.black_12` | visible | hidden | true |
| **Typing** | `Colors.blue_03` | `Colors.black_17` | `Colors.black_12` | visible | visible | true |
| **Filled** | `Colors.black_04` | `Colors.black_17` | `Colors.black_12` | hidden | visible | true |
| **Disabled** | `Colors.black_03` | `Colors.black_08` | `Colors.black_08` | hidden | hidden | false |

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **List search** | Tìm kiếm trong danh sách dài | Chỉ filter đơn giản 3-5 options — dùng Chip group | Search giao dịch lịch sử, search contacts |
| **Service search** | Tìm dịch vụ/merchant | Danh mục cố định — dùng tabs/chips | Search dịch vụ trên Home, search merchant |
| **Global search** | Search bar chính của app | — | Search bar trên Home screen MoMo |

---

## SSR Pattern

### Search with Results List
```json
{
  "id": "search_section",
  "type": "section",
  "children": [
    {
      "component": "InputSearch",
      "props": {
        "placeholder": "Tìm kiếm giao dịch",
        "size": "medium"
      },
      "onChange": "setState://searchQuery"
    },
    {
      "id": "search_results",
      "type": "section",
      "forEach": "{{data.searchResults}}",
      "render": {
        "component": "ListItem",
        "props": {
          "title": "{{item.title}}",
          "subtitle": "{{item.date}}",
          "rightText": "{{item.amount}}"
        },
        "onPress": "navigate://TransactionDetail?id={{item.id}}"
      }
    }
  ]
}
```

### Global Search Bar
```json
{
  "component": "InputSearch",
  "props": {
    "placeholder": "Tìm dịch vụ, bạn bè...",
    "size": "large"
  },
  "onFocus": "navigate://SearchScreen",
  "onChange": "setState://globalSearch"
}
```

---

## Accessibility

- Search icon phải accessible — role "search".
- Placeholder announce: "Tìm kiếm giao dịch, search field".
- Cancel button: announce "Cancel search".
- Results count announce khi results change: "5 results found".

---

## Usage Guidelines

### Do
- Dùng full width cho search bar.
- Show Cancel button khi focused — cho phép user dismiss nhanh.
- Implement live search (debounced) hoặc search on submit.
- Clear results khi query cleared.

### Don't
- Không dùng cho simple filter — dùng **Chip** group.
- Không hide search icon — user cần visual cue đây là search.
- Không disable Cancel khi focused — luôn cho phép dismiss.
